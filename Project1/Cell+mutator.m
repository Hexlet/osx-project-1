//
//  Cell+mutator.m
//  Project1
//
//  Created by sashkam on 31.10.12.
//  Copyright (c) 2012 Verveyko Alexander. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void) mutate:(int)percent{
    // Отладочная проверка параметра
    NSAssert((percent >= 0) && (percent <= 100), @"percent should be in range(0,100)");
    
    // Если надо мутировать 0 %  - то ничего не делаем
    if (percent == 0) return;
    
    // Переводим процент в количество элементов
    int count = round(DNA_LENGHT * percent / 100);
    
    static NSMutableArray *tmpArray = nil;
    
    // Массив создается только при первом вызове метода
    if (!tmpArray) {
        tmpArray = [NSMutableArray arrayWithCapacity:DNA_LENGHT];
        
        // Вспомогательный массив последовательных элементов
        for (int i = 0; i < DNA_LENGHT; i++) {
            [tmpArray addObject:[NSNumber numberWithInt:i]];
        }
    }
    
    // Перемешиваем массив, для получения уникальных неповторяющихся индексов
    for (int i = 0; i < count; i++) {
        int j = i + arc4random() % (DNA_LENGHT - i);
        [tmpArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    }

    // Получаем срез массива необходимого размера count
    NSArray *uniqueIndexes = [tmpArray subarrayWithRange: NSMakeRange(0, count)];
    
    NSMutableArray *tmpSymbols;
    
    // Пробежимся по случайным индексам
    for (NSNumber *index in uniqueIndexes){
        
        // Создадим вспомогательный массив из символов ДНК
        tmpSymbols = [NSMutableArray arrayWithArray:self.DNASymbols];
        
        // Выберем случайный индекс
        int rnd_index = arc4random() % [tmpSymbols count];
        
        // Если символ по этому индексу такой-же как и старый,
        if ([tmpSymbols[rnd_index] isEqualToString:self.DNA[[index integerValue]]]){
            
            // то удалим этот символ из вспомогательного массива
            [tmpSymbols removeObjectAtIndex:rnd_index];
            
            // и выберем случайно из оставшихся символов
            rnd_index = arc4random() % [tmpSymbols count];
        }
        
        // Заменим символ на уникалный новый
        // DEBUG: NSLog(@"at index: %li %@ replace to %@", [index integerValue], self.DNA[[index integerValue]], tmpSymbols[rnd_index]);
        [self.DNA replaceObjectAtIndex:[index integerValue] withObject:tmpSymbols[rnd_index]];
    }
}
@end

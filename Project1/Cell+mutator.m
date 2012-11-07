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
    int count = round(DNA_LENGHT * percent / 100.0);
    
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
    
    NSMutableArray *tmpNucleotides;
    
    // Пробежимся по случайным индексам
    for (NSNumber *index in uniqueIndexes){
        
        // Создадим вспомогательный массив из нуклеотидов
        tmpNucleotides = [NSMutableArray arrayWithArray:nucleotides];
        
        // Выберем случайный индекс
        int rnd_index = arc4random() % [tmpNucleotides count];
        
        // Если символ по этому индексу такой-же как и старый,
        if ([tmpNucleotides[rnd_index] isEqualToString:DNA[[index integerValue]]]){
            
            // то удалим этот символ из вспомогательного массива
            [tmpNucleotides removeObjectAtIndex:rnd_index];
            
            // и выберем случайно из оставшихся символов
            rnd_index = arc4random() % [tmpNucleotides count];
        }
        
        // Заменим символ на уникалный новый
        // DEBUG: NSLog(@"at index: %li %@ replace to %@", [index integerValue], DNA[[index integerValue]], tmpNucleotides[rnd_index]);
        [DNA replaceObjectAtIndex:[index integerValue] withObject:tmpNucleotides[rnd_index]];
    }
}
@end

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
    
    static NSMutableArray *tmpArray = nil;
    
    //Переводим процент в количество элементов
    int count = DNA_LENGHT * percent / 100;
    
    //Массив создается только при первом вызове метода
    if (!tmpArray) {
        tmpArray = [NSMutableArray arrayWithCapacity:DNA_LENGHT];
        
        for (int i = 0; i < DNA_LENGHT; i++) {
            [tmpArray addObject:[NSNumber numberWithInt:i]];
        }
    }
    
    // Перемешиваем массив
    for (int i = 0; i < count; i++) {
        int j = i + arc4random() % (DNA_LENGHT - i);
        [tmpArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    }

    // Получаем срез массива необходимого размера count
    NSArray *uniqueIndexes = [tmpArray subarrayWithRange: NSMakeRange(0, count)];
    
    // Заменим элементы по случайным индексам
    for (NSNumber *index in uniqueIndexes){
        // Ищем случайный символ и меняем, проверяя на не совпадение со старым
        int rnd_index = arc4random() % 4;
        while ([self.DNA[[index integerValue]] isEqualToString:self.DNASymbols[rnd_index]]) {
            rnd_index = arc4random() % 4;
        }
        // DEBUG: NSLog(@"at index: %li %@ replace to %@", [index integerValue], self.DNA[[index integerValue]], self.DNASymbols[rnd_index]);
        [self.DNA replaceObjectAtIndex:[index integerValue] withObject:self.DNASymbols[rnd_index]];
    }
}
@end

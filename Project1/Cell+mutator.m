//
//  Cell+mutator.m
//  Project1
//
//  Created by sashkam on 31.10.12.
//  Copyright (c) 2012 Verveyko Alexander. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
- (NSArray *) shuffleArray: (NSArray *) anArray anCount: (int) count{
    // Случайно перемешать массив
    NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:anArray];
    for (int i = 0; i < count; i++) {
        int j = i + arc4random() % ([anArray count] - i);
        [tmpArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    return tmpArray;
}

- (void) mutate:(int)percent{
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:DNA_LENGHT];
    for (int i = 0; i < DNA_LENGHT; i++) {
        [tmpArray addObject:[NSNumber numberWithInt:i]];
    }
    
    int count = DNA_LENGHT * percent / 100;
    
    //Перемешиваем массив чисел от 1 до 100 и получаем срез массива необходимого размера count
    NSArray *uniqueIndexes = [[NSArray arrayWithArray:[self shuffleArray:tmpArray anCount:count]]
                              subarrayWithRange: NSMakeRange(0, count)];
    
    NSMutableArray *DNASymbols;
    for (NSNumber *index in uniqueIndexes){
        //На каждом шаге берем случайно перемешанный массив символов ДНК
        DNASymbols = [NSArray arrayWithArray:[self shuffleArray:DNA_SYMBOLS anCount:DNA_SYMBOLS_COUNT]];
        // Если 0-й элемент не такойже, что и в _DNA - заменяем 0-м иначе 1-м.
        if ( ! [self.DNA[[index integerValue]] isEqualToString:DNASymbols[0]]){
            [self.DNA replaceObjectAtIndex:[index integerValue] withObject:DNASymbols[0]];
        }
        else
        {
            [self.DNA replaceObjectAtIndex:[index integerValue] withObject:DNASymbols[1]];
        }
    }
}
@end

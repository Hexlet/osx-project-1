//
//  Cell+Mutator.m
//  HexletDNA
//
//  Created by Aleksandr Shepeliev on 05.11.12.
//  Copyright (c) 2012 Aleksandr Shepeliev. All rights reserved.
//

#import <stdlib.h>
#import "Cell+Mutator.h"
#import "Cell.h"

@implementation Cell (Mutator)

- (void) mutate:(int)withPercent {
    
    // создаём массив индексов
    NSMutableArray* idxs = [NSMutableArray arrayWithCapacity:[self length]];
    for (int i = 0; i < [self length]; ++i) {
        NSNumber* idx = [NSNumber numberWithInt:i];
        [idxs addObject:idx];
    }
    
    // перемешиваем индексы
    for (NSUInteger i = 0; i < [idxs count]; ++i) {
        [idxs exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform([idxs count] - 1)];
    }
    
    // определяем какое количество символов необходимо мутировать
    int n = withPercent / 100.0 * [self length];
    
    // мутируем цепочку
    for (int i = 0; i < n; ++i) {
        // получаем очередной индекс цепочки ДНК, который будем мутировать
        NSInteger idx = [[idxs objectAtIndex:i] integerValue];
        
        // чтобы гарантировать, что код в цеопчке будет изменён,
        // удалим изменяемый символ из множества
        NSMutableString* codes = [NSMutableString stringWithCapacity:4];
        [codes appendString:@"ATGC"];
        NSString* mutationCode = [DNA objectAtIndex:idx];
        [codes deleteCharactersInRange:[codes rangeOfString:mutationCode]];
        
        // создаём интервал единичной длины со случайной начальной позицией
        NSRange range = {arc4random_uniform(3), 1};
        
        // меняем код 
        [DNA replaceObjectAtIndex:idx withObject:[codes substringWithRange:range]];
    }
}

@end

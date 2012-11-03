//
//  Cell+mutator.m
//  dna
//
//  Created by Igor Pavlov on 03.11.12.
//  Copyright (c) 2012 Igor Pavlov. All rights reserved.
//

#import "Cell+mutator.h"


@implementation Cell (mutator)


- (void) mutate:(int)percent
{
    const int maxPercent = 100;
    
    // проверка на правильность аргумента
    if (percent < 0  ||  percent > maxPercent)
        @throw [NSException exceptionWithName:NSRangeException reason:@"argument is out of [0..100] range" userInfo:nil];
    
    // если задано изменение 0%, то ничего делать не надо, сразу выход
    if (0 == percent)
        return;
    
    const u_int32_t dnaCharCount = [Cell getDnaCharCount];
    
    // создать массив индексов и зарезервировать в нем место
    NSMutableArray *indices = [NSMutableArray arrayWithCapacity:dnaCharCount];
    
    // заполнить индексы
    for (u_int32_t i = 0; i != dnaCharCount; ++i)
    {
        [indices addObject:[NSNumber numberWithUnsignedInteger:i]];
    }
    
    // количество символов к мутации
    const u_int32_t indexCount = dnaCharCount*percent/maxPercent;
    
    // если мутация затрагивает менее 100% символов, перемешать индексы для случайности изменений
    if (percent < maxPercent)
    {
        // перемешивание
        for (u_int32_t i = 0; i != indexCount; ++i)
        {
            const NSUInteger j = i + arc4random_uniform(dnaCharCount - i);
            [indices exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
    }
    
    const u_int32_t dnaAlphabetSize = [Cell getDnaAlphabetSize];
    
    // перебрать первые indexCount (случайных) индексов
    for (u_int32_t i = 0; i != indexCount; ++i)
    {
        const NSUInteger changeIdx  = [(NSNumber*)[indices objectAtIndex:i] unsignedIntegerValue];
        const NSUInteger charIdx    = [(NSNumber*)[dna objectAtIndex:changeIdx] unsignedIntegerValue];
        const NSUInteger newCharIdx = (charIdx + 1 + arc4random_uniform(dnaAlphabetSize - 1)) % dnaAlphabetSize; // inspired by Sachs

        [dna replaceObjectAtIndex:changeIdx withObject:[NSNumber numberWithUnsignedInteger:newCharIdx]];
    }
}


@end

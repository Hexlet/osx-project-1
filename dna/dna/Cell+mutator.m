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
    
    const NSUInteger dnaCharCount = [dna count];
    
    // создать массив индексов и зарезервировать в нем место
    NSMutableArray *indices = [NSMutableArray arrayWithCapacity:dnaCharCount];
    
    // заполнить индексы
    for (NSUInteger i = 0; i != dnaCharCount; ++i)
    {
        [indices addObject:[NSNumber numberWithUnsignedInteger:i]];
    }
    
    // количество символов к мутации
    const NSUInteger indexCount = dnaCharCount*percent/maxPercent;
    
    // если мутация затрагивает менее 100% символов, перемешать индексы для случайности изменений
    if (percent < maxPercent)
    {
        // перемешивание
        for (NSUInteger i = 0; i != indexCount; ++i)
        {
            const NSUInteger j = i + arc4random_uniform((u_int32_t)(dnaCharCount - i));
            [indices exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
    }

    const NSArray   *nucleotides     = [Cell getNucleotides];
    const NSUInteger nucleotideCount = [nucleotides count];
    
    // перебрать первые indexCount (случайных) индексов
    for (NSUInteger i = 0; i != indexCount; ++i)
    {
        const NSUInteger changeIndex        = [(NSNumber*)[indices objectAtIndex:i] unsignedIntegerValue];
        const NSUInteger curNucleotideIndex = [nucleotides indexOfObject:[dna objectAtIndex:changeIndex]];
        const NSUInteger newNucleotideIndex = (curNucleotideIndex + 1 + arc4random_uniform((u_int32_t)(nucleotideCount - 1))) % nucleotideCount; // inspired by Sachs
        [dna replaceObjectAtIndex:changeIndex withObject:[nucleotides objectAtIndex:newNucleotideIndex]];
    }
}


@end

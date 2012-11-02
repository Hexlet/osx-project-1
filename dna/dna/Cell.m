//
//  Cell.m
//  dna
//
//  Created by Igor Pavlov on 02.11.12.
//  Copyright (c) 2012 Igor Pavlov. All rights reserved.
//
#import <stdlib.h>
#import "Cell.h"

#define countof(a) (sizeof(a)/sizeof(a[0]))

// Количество символов в ДНК
static const int dnaCharCount = 100;

// Алфавит, составляющий ДНК
static const char dnaAlphabet[] = { 'A', 'T', 'G', 'C' };


@implementation Cell
{
    NSMutableArray  *dna;
}


- (id) init
{
    self = [super init];
    if (!self)
        return nil;

    // Создать массив ДНК и зарезервировать в нем место
    dna = [NSMutableArray arrayWithCapacity:dnaCharCount];
    if (!dna)
        return nil;
 
    // Проинициализировать массив ДНК случайными символами из заданного алфавита
    for (int i = 0; i != dnaCharCount; ++i)
    {
        const int randCharIdx = rand() % countof(dnaAlphabet);
        [dna addObject:[NSNumber numberWithChar:dnaAlphabet[randCharIdx]]];
    }
    
    return self;
}


- (int) hammingDistance:(Cell*)otherCell
{
    // Проверка на правильность аргумента
    if (!otherCell)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Null argument" userInfo:nil];

    int distance = 0;
    
    for (int i = 0; i != dnaCharCount; ++i)
    {
        NSNumber *nl = (NSNumber*)[dna objectAtIndex:i];
        NSNumber *nr = (NSNumber*)[otherCell->dna objectAtIndex:i];
        if ([nl charValue] != [nr charValue])
            ++distance;
    }
    
    return distance;
}


// Отладочная печать
- (void) print
{
    NSMutableString *dnaStr = [NSMutableString stringWithCapacity:dnaCharCount];

    for (int i = 0; i != dnaCharCount; ++i)
    {
        [dnaStr appendFormat:@"%c", [(NSNumber*)[dna objectAtIndex:i] charValue]];
    }
    
    NSLog(@"DNA: %@", dnaStr);
}


- (Cell*) clone
{
    Cell *newCell = [[Cell alloc] init];
    newCell->dna = [NSMutableArray arrayWithArray:dna];
    return newCell;
}

    
@end


    
@implementation Cell (mutator)

    
- (void) mutate:(int)x
{
    const int maxPercent = 100;

    // Проверка на правильность аргумента
    if (x < 0  ||  x > maxPercent)
        @throw [NSException exceptionWithName:NSRangeException reason:@"argument is out of [0..100] range" userInfo:nil];
    
    // Если задано изменение 0%, то ничего делать не надо, сразу выход
    if (0 == x)
        return;
    
    // Создать массив индексов и зарезервировать в нем место
    NSMutableArray *indices = [NSMutableArray arrayWithCapacity:maxPercent];
    
    // заполнить индексы
    for (int i = 0; i != maxPercent; ++i)
    {
        [indices addObject:[NSNumber numberWithUnsignedInteger:i]];
    }
    
    // если мутация затрагивает менее 100% символов, перемешать индексы для случайности изменений
    if (x < maxPercent)
    {
        // перемешивание
        for (int i = 0; i != x; ++i)
        {
            const int j = rand() % maxPercent;
            [indices exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
    }

    // Перебрать первые x (случайных) индексов 
    for (int i = 0; i != x; ++i)
    {
        const NSUInteger changeIdx = [(NSNumber*)[indices objectAtIndex:i] unsignedIntegerValue];
        NSNumber *nl = (NSNumber*)[dna objectAtIndex:changeIdx];
        
        for (;;)
        {
            const int randCharIdx = rand() % countof(dnaAlphabet);
            if (dnaAlphabet[randCharIdx] != [nl charValue])
            {
                [dna replaceObjectAtIndex:changeIdx withObject:[NSNumber numberWithChar:dnaAlphabet[randCharIdx]]];
                break;
            }
        }
    }
}

    
@end

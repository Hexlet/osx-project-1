//
//  Cell.m
//  dna
//
//  Created by Igor Pavlov on 02.11.12.
//  Copyright (c) 2012 Igor Pavlov. All rights reserved.
//

#import "Cell.h"


// количество символов в алфавите ДНК
static const u_int32_t dnaAlphaBetSize = 4;

// алфавит, составляющий ДНК
static const char dnaAlphabet[dnaAlphaBetSize] = { 'A', 'T', 'G', 'C' };

// количество символов в ДНК
static const u_int32_t dnaCharCount = 100;


@implementation Cell


+ (u_int32_t) getDnaAlphabetSize
{
    return dnaAlphaBetSize;
}


+ (u_int32_t) getDnaCharCount
{
    return dnaCharCount;
}


- (id) init
{
    self = [super init];
    if (!self)
        return nil;

    // создать массив ДНК и зарезервировать в нем место
    dna = [NSMutableArray arrayWithCapacity:dnaCharCount];
    if (!dna)
        return nil;
 
    // проинициализировать массив ДНК случайными индексами символов из заданного алфавита
    for (u_int32_t i = 0; i != dnaCharCount; ++i)
    {
        const NSUInteger randCharIdx = arc4random_uniform([Cell getDnaAlphabetSize]);
        [dna addObject:[NSNumber numberWithUnsignedInteger:randCharIdx]];
    }
    
    return self;
}


- (int) hammingDistance:(Cell*)otherCell
{
    // проверка на правильность аргумента
    if (!otherCell)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Null argument" userInfo:nil];

    int distance = 0;
    
    for (u_int32_t i = 0; i != dnaCharCount; ++i)
    {
        const NSNumber *nl = (NSNumber*)[dna objectAtIndex:i];
        const NSNumber *nr = (NSNumber*)[otherCell->dna objectAtIndex:i];
        if ([nl unsignedIntegerValue] != [nr unsignedIntegerValue])
            ++distance;
    }
    
    return distance;
}


- (NSString*) description
{
    NSMutableString *dnaStr = [NSMutableString stringWithCapacity:dnaCharCount];

    for (u_int32_t i = 0; i != dnaCharCount; ++i)
    {
        const NSUInteger charIdx = [(NSNumber*)[dna objectAtIndex:i] unsignedIntegerValue];
        [dnaStr appendFormat:@"%c", dnaAlphabet[charIdx]];
    }
    
    return dnaStr;
}


- (Cell*) clone
{
    Cell *newCell = [[Cell alloc] init];
    newCell->dna = [dna mutableCopy];
    return newCell;
}

    
@end

//
//  Cell.m
//  dna
//
//  Created by Igor Pavlov on 02.11.12.
//  Copyright (c) 2012 Igor Pavlov. All rights reserved.
//

#import "Cell.h"


#define countof(a) (sizeof(a)/sizeof(a[0]))


// алфавит, составляющий ДНК
static const char       dnaAlphabet[] = { 'A', 'T', 'G', 'C' };

// количество символов в алфавите ДНК
static const NSUInteger dnaAlphaBetSize = countof(dnaAlphabet);

// количество символов в ДНК
static const NSUInteger dnaCharCount = 100;


@implementation Cell


+ (NSUInteger) getDnaAlphabetSize
{
    return dnaAlphaBetSize;
}


+ (const char*) getDnaAlphabet
{
    return dnaAlphabet;
}


+ (NSUInteger) getAlphabetCharIndex:(char)c
{
    switch (c)
    {
    case 'A':
        return 0;
            
    case 'T':
        return 1;
            
    case 'G':
        return 2;
            
    case 'C':
        return 3;
    }
    
    @throw [NSException exceptionWithName:NSRangeException reason:@"argument is not from the set: 'A', 'T', 'G', 'C'" userInfo:nil];
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
    for (NSUInteger i = 0; i != dnaCharCount; ++i)
    {
        const NSUInteger randCharIdx = arc4random_uniform((u_int32_t)dnaAlphaBetSize);
        [dna addObject:[NSNumber numberWithChar:dnaAlphabet[randCharIdx]]];
    }
    
    return self;
}


- (int) hammingDistance:(Cell*)otherCell
{
    // проверка на правильность аргумента
    if (!otherCell)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Null argument" userInfo:nil];

    int distance = 0;
    
    for (NSUInteger i = 0; i != dnaCharCount; ++i)
    {
        const NSNumber *nl = (NSNumber*)[dna objectAtIndex:i];
        const NSNumber *nr = (NSNumber*)[otherCell->dna objectAtIndex:i];
        // сравнение индексов на буквы, составляющие алфавит ДНК
        if ([nl charValue] != [nr charValue])
            ++distance;
    }
    
    return distance;
}


- (NSString*) description
{
    NSMutableString *dnaStr = [NSMutableString stringWithCapacity:dnaCharCount];

    for (NSUInteger i = 0; i != dnaCharCount; ++i)
    {
        const char c = [(NSNumber*)[dna objectAtIndex:i] charValue];
        [dnaStr appendFormat:@"%c", c];
    }
    
    return dnaStr;
}


- (id) copyWithZone:(NSZone *)zone
{
    Cell *copy = [[[self class] allocWithZone:zone] init];
    if (!copy)
        return nil;
    
    copy->dna = [dna mutableCopyWithZone:zone];
    if (!copy->dna)
        return nil;

    return copy;
}


@end

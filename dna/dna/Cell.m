//
//  Cell.m
//  dna
//
//  Created by Igor Pavlov on 02.11.12.
//  Copyright (c) 2012 Igor Pavlov. All rights reserved.
//

#import "Cell.h"


@implementation Cell


+ (NSArray*) getNucleotides
{
    // алфавит, составляющий ДНК
    static NSArray *nucleotides;
    if (!nucleotides)
        nucleotides = @[@"A", @"T", @"G", @"C"];
    return nucleotides;
}


- (id) init
{
    self = [super init];
    if (!self)
        return nil;

    // количество символов в ДНК
    const NSUInteger dnaCharCount = 100;
    
    // создать массив ДНК и зарезервировать в нем место
    dna = [NSMutableArray arrayWithCapacity:dnaCharCount];
    if (!dna)
        return nil;
 
    NSArray *nucleotides = [Cell getNucleotides];
    const NSUInteger nucleotideCount = [nucleotides count];
    
    // проинициализировать массив ДНК случайными символами нуклеотидов из заданного алфавита
    for (NSUInteger i = 0; i != dnaCharCount; ++i)
    {
        const NSUInteger randCharIdx = arc4random_uniform((u_int32_t)nucleotideCount);
        [dna addObject:[nucleotides objectAtIndex:randCharIdx]];
    }
    
    return self;
}


- (int) hammingDistance:(Cell*)otherCell
{
    // проверка на правильность аргумента
    if (!otherCell)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Null argument" userInfo:nil];

    int distance = 0;
    
    for (NSUInteger i = 0, dnaCharCount = [dna count]; i != dnaCharCount; ++i)
    {
        const NSString *nl = [dna objectAtIndex:i];
        const NSString *nr = [otherCell->dna objectAtIndex:i];
        if (nl != nr)
            ++distance;
    }
    
    return distance;
}


- (NSString*) description
{
    return [dna componentsJoinedByString:@""];
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

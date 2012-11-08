//
//  DNAFactory.m
//  DNA
//
//  Created by user on 11/8/12.
//  Copyright (c) 2012 azhohov. All rights reserved.
//

#import "DNAFactory.h"

@implementation DNAFactory

static NSArray *DNABases = nil;

+(void)initialize
{
    if (!DNABases)
    {
        DNABases = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    }
}

+(NSString *)getRandomDNABase
{
    return [DNABases objectAtIndex: arc4random() % [DNABases count]];
}

+(NSString *)getRandomDNABaseExclude:(NSString *) dnaBase
{
    NSUInteger dnaBaseIndex = [DNABases indexOfObject:dnaBase];
    
    NSAssert(dnaBaseIndex != NSNotFound, @"Wrong DNA base");
    
    NSUInteger offset = (arc4random() % ([DNABases count] - 1)) + 1; //offset is in range [1..3]
    NSUInteger newDnaBaseIndex = (dnaBaseIndex + offset ) % [DNABases count];
    return (NSString *)[DNABases objectAtIndex: newDnaBaseIndex];
}

@end

//
//  Cell.m
//  DNA
//
//  Created by user on 11/6/12.
//  Copyright (c) 2012 azhohov. All rights reserved.
//

#import "Cell.h"
#import "DNAFactory.h"

@implementation Cell

static NSUInteger DNA_LENGTH = 100;

- (id)init
{
    self = [super init];
    if (self)
    {        
        _DNA = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
        
        for (int i = 0; i < DNA_LENGTH; i++)
        {
            NSString *randomDNABase = [DNAFactory getRandomDNABase];
            [_DNA addObject:randomDNABase];
        }
    
    }
    return self;
}

- (int)hammingDistance:(Cell *)aCell
{
    NSParameterAssert(aCell);
    
    int distance = 0;
    for (int i = 0; i < DNA_LENGTH; i++)
    {
        NSString *dnaBase1 = (NSString *)[_DNA objectAtIndex:i];
        NSString *dnaBase2 = (NSString *)[aCell.DNA objectAtIndex:i];
        if ([dnaBase1 isNotEqualTo:dnaBase2])
        {
            distance++;
        }
    }
    return distance;
}

- (NSString *)description
{
    return [_DNA componentsJoinedByString:@""];
}

@end

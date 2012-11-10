//
//  Cell.m
//  dna
//
//  Created by Yuri Kirghisov on 07.11.12.
//  Copyright (c) 2012 Yuri Kirghisov. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>

@implementation Cell

@synthesize DNA;

- (id)init
{
    self = [super init];
    if (self) {
        dnaLetters[0] = @"A";
        dnaLetters[1] = @"T";
        dnaLetters[2] = @"G";
        dnaLetters[3] = @"C";
        
        DNA = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
        
        int i;
        for (i=0; i<100; i++) {
            int r = arc4random_uniform(4);
            [DNA addObject:dnaLetters[r]];
        }
    }
    
    return self;
}

- (NSString *)description
{
    NSString *result = nil;
    if (DNA)
        result = [DNA componentsJoinedByString:@""];

    return result;
}

- (int)hammingDistance:(Cell *)aCell
{
    if (!aCell)
        return 0;

    int i;
    int distance = 0;
    for (i=0; i<100; i++) {
        if ([self.DNA[i] compare:aCell.DNA[i]] != NSOrderedSame)
            distance++;
    }

    return distance;
}

@end

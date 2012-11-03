//
//  Cell.m
//  osx-project-1
//
//  Created by Pavel Popchikovsky on 11/4/12.
//  Copyright (c) 2012 Pavel Popchikovsky. All rights reserved.
//

#import "Cell.h"
#import "Gene.h"

const int DNA_SIZE = 100;

@implementation Cell

-(id) init
{
    self = [super init];
    if(self)
    {
        DNA = [[NSMutableArray alloc] initWithCapacity:DNA_SIZE];
        [self fillDNAWithRandomValues];
    }
    return self;
}

-(void) fillDNAWithRandomValues
{
    [DNA removeAllObjects];
    for(int i = 0; i < DNA_SIZE; i++)
        [DNA addObject:[[Gene alloc] initWithRandomValue]];
}

-(int) hammingDistance:(Cell *)cell
{
    int distance = 0;
    for(int i = 0; i < DNA_SIZE; i++)
    {
        Gene* geneSelf = [self->DNA objectAtIndex:i];
        Gene* geneCell = [cell->DNA objectAtIndex:i];
        if(![geneSelf equalsTo:geneCell])
            distance += 1;        
    }
    return distance;
}

@end

//
//  Cell.m
//  DNA
//
//  Created by User on 31.10.12.
//  Copyright (c) 2012 Naota. All rights reserved.
//

#import "Cell.h"



@implementation Cell
-(id)init
{
    if (self = [super init])
    {
        
        _dna = [NSMutableArray arrayWithCapacity:DNA_COUNT];
        
        initDnaItems;
        
        for (int i = 0; i<DNA_COUNT; i++)
        {
            [_dna addObject:[dnaItem objectAtIndex:arc4random()%[dnaItem count]]];
        }
    }
    return self;
}

- (int)hammingDistance:(Cell*)targetCell
{
    int count = 0;
    for (int i=0; i<DNA_COUNT; i++)
    {
        if (![[_dna objectAtIndex:i] isEqual:[targetCell.dna objectAtIndex:i]])
        {
            count++;
        }
    }
    return count;
}

@end

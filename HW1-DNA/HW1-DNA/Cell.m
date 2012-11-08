//
//  Cell.m
//  HW1-DNA
//
//  Created by Victor Gafiatulin on 05.11.12.
//  Copyright (c) 2012 Victor Gafiatulin. All rights reserved.
//

#import "Cell.h"
@implementation Cell

- (id)init
{
    self = [super init];
    if(self)
    {
        _DNA = [[NSMutableArray alloc] initWithCapacity:capacity];
        _nucleobase = @[ @"A", @"T", @"G", @"C" ];
        for(int i = 0; i < capacity; i++)
		{
            [_DNA addObject: [_nucleobase objectAtIndex:arc4random_uniform(4)]];
        }
    }
    return self;
}


- (int)hammingDistance: (Cell*) anotherCell
{
    int distance = 0;
    for (int i = 0; i< capacity; i++)
    {
        if(![[_DNA objectAtIndex:i] isEqualTo: [anotherCell.DNA objectAtIndex:i]])
            distance++;
    }
    return distance;
}

@end

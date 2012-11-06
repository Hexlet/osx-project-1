//
//  Cell.m
//  DNA
//
//  Created by Straga on 06.11.12.
//  Copyright (c) 2012 Straga. All rights reserved.
//

#import "Cell.h"

const NSString *acid[4] = {@"A", @"T", @"G", @"C"};

@implementation Cell

-(id) init{
    self = [super init];
    if (self) {
        
        _dna = [[NSMutableArray alloc] initWithCapacity: 100];
        
        for(int i = 0; i < 100; i++)
        {
            [_dna addObject: acid[arc4random()%4]];
        }
    }
    
    return self;
}

-(int) hammingDistance:(Cell *)reactiv{
    
    unsigned dist = 0;
    
    for(int i = 0; i < 100; i++)
    {
        if([_dna objectAtIndex: i] != [reactiv.dna objectAtIndex: i])
        {
            dist++;
        }
    }
    
    return dist;
}

- (NSString *) description
{
    return [_dna componentsJoinedByString: @""];
}

@end

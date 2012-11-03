//
//  Cell.m
//  DNA
//
//  Created by Mac on 11/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell
{
    
}

@synthesize DNA = _DNA;

- (id)init
{
    self = [super init];
    _DNA = [[NSMutableArray alloc] initWithCapacity:100];
    NSArray *atcgArray = [[NSArray alloc]initWithObjects:@"A",@"C",@"T",@"G", nil];
    
    for (int i = 0; i < 100; i++)
    {
        int randomIndex = arc4random_uniform(4);
        NSString *objectToAdd = [atcgArray objectAtIndex:randomIndex];
        [_DNA addObject:objectToAdd];
    }
    
    return self;
}

- (int)hammingDistanceWithCell:(Cell *)cellToCompareWith
{
    //---Method to show difference between 2 cells
    //returns number of different acids in cell---
    
    int differenceCounter = 0;
    
    for (int i = 0; i < [self.DNA count]; i++)
    {   
        if ([self.DNA objectAtIndex:i] != [cellToCompareWith.DNA objectAtIndex:i])
        {
            differenceCounter++;
        }
    }
    
    NSLog(@"Hamming distance between cells is: %i", differenceCounter);
    return differenceCounter;
}

@end

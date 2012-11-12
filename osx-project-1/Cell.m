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
@synthesize atcgArray = _atcgArray;
int DNASize = 100;


- (id)init
{
    self = [super init];
    if (self)
    {
        _DNA = [[NSMutableArray alloc] initWithCapacity:DNASize];
        atcgArray = [[NSArray alloc]initWithObjects:@"A",@"T",@"C",@"G", nil];
    
        for (int i = 0; i < DNASize; i++)
        {
            int randomIndex = arc4random_uniform(4);
            NSString *objectToAdd = [atcgArray objectAtIndex:randomIndex];
            [_DNA addObject:objectToAdd];
        }
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
        if (![[self.DNA objectAtIndex:i] isEqualTo:[cellToCompareWith.DNA objectAtIndex:i]])
        {
            differenceCounter++;
            //NSLog(@"%@ %@", [self.DNA objectAtIndex:i], [cellToCompareWith.DNA objectAtIndex:i]);
        }
    
        //---Test for equality---
        if ([[self.DNA objectAtIndex:i] isEqualTo:[cellToCompareWith.DNA objectAtIndex:i]])
        {
            //NSLog(@"%@ %@", [self.DNA objectAtIndex:i], [cellToCompareWith.DNA objectAtIndex:i]);
        }
    
    }

    NSLog(@"Hamming distance between cells is: %i", differenceCounter);
    return differenceCounter;
}

@end

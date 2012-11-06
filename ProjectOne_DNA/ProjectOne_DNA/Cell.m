//
//  Cell.m
//  ProjectOne_DNA
//
//  Created by mac on 30.10.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init
{
    self = [super init];
    if (self) {
        _dnaCode = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        _dna = [NSMutableArray arrayWithCapacity:100];
        for (int i =0; i<100; i++) 
            [_dna addObject:[_dnaCode objectAtIndex:arc4random()%[_dnaCode count]]];
    }    

    return self;
}


-(int)hammingDistance:(Cell *)cell
{
    int result;
    
    for (int i = 0; i<[_dna count]; i++)
        if([[_dna objectAtIndex:i] isNotEqualTo:[cell.dna objectAtIndex:i]])
            result++;
    
    return result;
}


@end



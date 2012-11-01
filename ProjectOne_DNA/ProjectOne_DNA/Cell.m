//
//  Cell.m
//  ProjectOne_DNA
//
//  Created by mac on 30.10.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize dna;
@synthesize dnaCode;

- (id)init
{
    self = [super init];
    if (self) {
        dnaCode = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        
        dna = [NSMutableArray arrayWithCapacity:100];
        for (int i =0; i<100; i++) 
            [dna addObject:[dnaCode objectAtIndex:arc4random()%[dnaCode count]]];
    }    

    return self;
}


-(int)hammingDistance:(Cell *)cell
{
    int result;
    
    for (int i = 0; i < [dna count]; i++) 
        if([[dna objectAtIndex:i] isNotEqualTo:[cell.dna objectAtIndex:i]])
            result++;
    
    return result;
}


@end



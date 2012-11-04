//
//  Cell.m
//  osx-project-1
//
//  Created by bj on 03.11.12.
//  Copyright (c) 2012 bj. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize dna;
@synthesize dnaSimbols;

- (id) init
{
    self = [super init];
    if (self)
    {
        dnaSimbols = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        
        dna = [NSMutableArray arrayWithCapacity:100];
        for (int i =0; i<100; i++) [dna addObject:[dnaSimbols objectAtIndex:arc4random()%[dnaSimbols count]]];
    }
    return self;
}

-(int)hammingDistance:(Cell *)cell
{
    int result = 0;
    
    for (int i = 0; i < [dna count]; i++)
        if([[dna objectAtIndex:i] isNotEqualTo:[cell.dna objectAtIndex:i]])
            result++;
    
    return result;
}

@end
//
//  Cell.m
//  Project1
//
//  Created by brevis on 10/31/12.
//  Copyright (c) 2012 brevis. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA;

-(id)init
{
    self = [super init];
    if ( self )
    {
        possibleGenes = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        DNA = [NSMutableArray arrayWithCapacity:100];
        
        for (int i=0;i<100;i++)
        {
            [DNA addObject:[possibleGenes objectAtIndex:arc4random()%4]];
        }
    }
    
    return self;
}

-(int)hammingDistance:(Cell *)cell
{
    int count = 0;
    
    for (int i=0;i<100;i++)
    {
        if ( ![[DNA objectAtIndex:i] isEqualTo:[cell.DNA objectAtIndex:i]] ) count++;
    }
    
    return count;
}

@end

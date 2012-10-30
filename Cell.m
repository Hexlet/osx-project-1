//
//  Cell.m
//  DNA
//
//  Created by Alexander on 30.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <stdlib.h>
#import "Cell.h"


const unichar DNAItems[kMaxDNAItems] = {'A', 'T', 'G', 'C'};

@implementation Cell

@synthesize dna;

//+ (id) alloc
//{
//    NSLog(@"Cell allocated");
//    
//    return [super alloc];
//}

- (id) init
{
    self = [super init];
    if(self)
    {
        dna = [[NSMutableArray alloc] initWithCapacity: kDNALength];
        
        int i = kDNALength;
        while(i--)
        {
            [dna addObject: [NSString stringWithFormat: @"%c", DNAItems[arc4random()%kMaxDNAItems]]];
        }
    }
    
    return self;
}

+ (id) cell
{
    return [[[self alloc] init] autorelease];
}

- (void) dealloc
{
    [dna release];
    
    [super dealloc];
    
//    NSLog(@"Cell deallocated");
}

- (NSString *) description
{
    return [dna componentsJoinedByString: @""];
}

- (unsigned) hammingDistance: (Cell *) cell
{
    unsigned dist = 0;
    
    for(int i = 0; i < kDNALength; i++)
    {
        if(![[dna objectAtIndex: i] isEqual: [cell.dna objectAtIndex: i]])
        {
            dist++;
        }
    }
    
    return dist;
}

@end

//
//  Cell.m
//  Project1-DNA
//
//  Created by Bogdan Pankiv on 11/3/12.
//  Copyright (c) 2012 Bogdan Pankiv. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init
{
    self = [super init];
    if (!self) return self;
    
    srandomdev();
    
    dna = [[NSMutableArray alloc] init];
    for (int i=0; i<100; ++i)
        [dna addObject: [[NSNumber alloc] initWithInt: random()%4] ];
    
    return self;
}

-(id) initWithCell:(Cell *)cell
{
    self = [super init];
    dna = [[NSMutableArray alloc] init];
    for (int i=0; i<100; ++i)
        [dna addObject: [cell getDnaAtPosition:i] ];
    return self;
}

-(int) hammingDistance:(Cell *)cell
{
    int distance = 0;
    for (int i=0; i<100; ++i) {
        if ([self getDnaAtPosition:i] != [cell getDnaAtPosition:i]) ++distance;
    }
    return distance;
}

-(NSNumber *) getDnaAtPosition:(int)pos
{
    if (pos<0 || pos>99) return NULL;
    return dna[pos];
}

-(void) print
{
    NSArray *values = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    NSString *result = [[NSString alloc] init];
    
    for (int i=0; i<100; ++i)
        result = [result stringByAppendingString: values[ [dna[i] intValue] ] ];

    NSLog(@"%@", result);
}
@end

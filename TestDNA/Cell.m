//
//  Cell.m
//  TestDNA
//
//  Created by Alex Vasilchenko on 01.11.12.
//  Copyright (c) 2012 Alex Vasilchenko. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init
{
    if (self = [super init])
    {
        arrayCapacity = 100;
        _dna = [[NSMutableArray alloc]initWithCapacity:arrayCapacity];
        dnaArray = [[NSArray alloc]initWithObjects:@"A", @"T", @"G", @"C",nil];
        for (int i = 0; i<arrayCapacity; i++)
        {
            [_dna addObject:[dnaArray objectAtIndex:arc4random()%4]];
        }
        
    }return self;
}

-(int)hammingDistance:(Cell *)c
{
    int j = 0;
    for (int i=0; i<arrayCapacity; i++) {
        if ([[self.dna objectAtIndex:i] isNotEqualTo:[c.dna objectAtIndex:i]])
        {
            j++;
        }
    }
    return j;
}

-(void)mutatorWithPercentOfDna:(int)m
{
    NSNumber *n;
    NSMutableArray *mutatorArray = [NSMutableArray array];
    int counter = 0;
    while (counter<m)
    {
        int j = arc4random()%100;
        n = [NSNumber numberWithInt:j];
        if (![mutatorArray containsObject:n]) {
            [mutatorArray addObject:n];
            counter++;
        }
    }
    for (int i=0;i<[mutatorArray count];i++)
    {
        int j = [[mutatorArray objectAtIndex:i]intValue];
        NSString *dnaObjectForReplace = [NSString stringWithString:[dnaArray objectAtIndex:arc4random()%4]];
        [self.dna replaceObjectAtIndex:j withObject:dnaObjectForReplace];
    
    }

}

@end

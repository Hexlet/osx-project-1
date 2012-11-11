//
//  Cell.m
//  osx-project-1
//
//  Created by bj on 03.11.12.
//  Copyright (c) 2012 bj. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init
{
    self = [super init];
    if (self)
    {
        _dnaSimbols = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        
        _dna = [NSMutableArray arrayWithCapacity:100];
        
        for (int i =0; i<100; i++) [_dna addObject:[_dnaSimbols objectAtIndex:arc4random()%[_dnaSimbols count]]];
    }
    return self;
}

-(int)hammingDistance:(Cell *)cell
{
    int result = 0;
    
    for (int i = 0; i < [_dna count]; i++)
        if([_dna objectAtIndex:i] != [[cell dna] objectAtIndex:i])
            result++;
    
    return result;
}

@end
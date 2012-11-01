//
//  Cell.m
//  DNA
//
//  Created by IBEC IBEC on 10/31/12.
//  Copyright (c) 2012 IBEC IBEC. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>

@implementation Cell

- (id)init
{
    self = [super init];
    if (self)
    {
        _DNALength = 100;
        _DNA = [[NSMutableArray alloc] init];
        _DNAs = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        for (int i = 0; i < _DNALength; i++) {
            [_DNA addObject:[_DNAs objectAtIndex:arc4random()%[_DNAs count]]];
        }
    }
    return self;
}

- (int)hammingDistance:(NSMutableArray *)DNAArray
{
    int hammingDistanceCount = 0;
    for (int i = 0; i < [_DNA count]; i++) {
        if (![[_DNA objectAtIndex:i] isEqual:[DNAArray objectAtIndex:i]])
        {
            hammingDistanceCount++;
        }
    }
    return hammingDistanceCount;
}

- (void)printDNA
{
    NSMutableString *dnaStr = [[NSMutableString alloc] init];
    for (NSString *str in _DNA)
    {
        [dnaStr appendString:str];
    }
    NSLog(@"%@", dnaStr);
}

@end

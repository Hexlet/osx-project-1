//
//  Cell.m
//  DNAapplication
//
//  Created by Admin on 11/9/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import "Cell.h"
#import "Utils.h"
#import <stdlib.h>

@implementation Cell

int ndaLength = 100;

-(id) init
{
    _components = [NSArray arrayWithObjects: @"A", @"T", @"G", @"D", nil];
    
    self = [super init];
    
    if (self)
    {
        _dna = [[NSMutableArray alloc] init];
        
        for (NSInteger i = 0; i < ndaLength; i++)
        {
            NSString *component = [Utils getRandomComponent:_components];
            [_dna addObject:component];
        }
    }
    
    return self;
}

-(int) hammingDistance:(Cell *) comparedCell
{
    int hDistance = 0;
    
    for (NSInteger i = 0; i < [_dna count]; i++)
    {
        if ([_dna objectAtIndex:i] != [[comparedCell dna] objectAtIndex:i])
        {
            hDistance++;
        }
    }
    
    return hDistance;
}

-(void) print
{
    NSMutableString *out = [[NSMutableString alloc] init];
    
    for (NSInteger i = 0; i < [_dna count]; i++)
    {
        NSMutableString *tempString = [NSMutableString stringWithFormat:@"%@ ", [_dna objectAtIndex:i]];
        [out appendString:tempString];
    }
    
    NSLog(@"%@", out);
    
}

@end

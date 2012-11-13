//
//  Cell.m
//  DNA
//
//  Created by Alex on 11/13/12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(NSString*) getRandomGenom
{
    int r = arc4random() % 4;
    
    NSString *genom;
    if (r == 0)
    {
        genom = @"A";
    }
    else if (r == 1)
    {
        genom = @"T";
    }
    else if (r == 2)
    {
        genom = @"G";
    }
    else if (r == 3)
    {
        genom = @"C";
    }
    
    return genom;
}

-(id) init
{
    self = [super init];
    
    if (self)
    {
        _DNA = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 100; ++i)
        {            
            [_DNA addObject:[self getRandomGenom]];
        }
        
    }
    
    return self;
}

-(int) hammingDistance: (Cell*)other
{
    int diff = 0;
    
    for (int i = 0; i < 100; ++i)
    {
        if ([_DNA objectAtIndex:i] != [[other DNA] objectAtIndex:i])
        {
            ++diff;
        }
    }
    
    return diff;
}

@end

@implementation Cell (mutator)

-(void) mutate: (int)count
{
    NSUInteger length = [_DNA count];
    
    int toReplace = 100.0 * length / count;
    
    for (int i = 0; i < toReplace; ++i)
    {
        [_DNA setObject:[self getRandomGenom] atIndexedSubscript:i];
    }
}

@end

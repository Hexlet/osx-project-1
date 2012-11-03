//
//  Cell+mutator.m
//  osx-project-1
//
//  Created by Pavel Popchikovsky on 11/4/12.
//  Copyright (c) 2012 Pavel Popchikovsky. All rights reserved.
//

#import "Cell+mutator.h"
#import "Gene.h"

@implementation Cell (mutator)

-(void) mutate:(int)percentage
{
    long genesToChangeCount = [DNA count] * percentage / 100;
    
    if(genesToChangeCount <= 0)
        return;
    
    if(genesToChangeCount >= [DNA count])
    {
        for(Gene* gene in DNA)
            [gene mutate];
        return;
    }
    
    long unchangedGenesCount = [DNA count] - genesToChangeCount;
    
    NSMutableArray* changeFlags = [[NSMutableArray alloc] initWithCapacity:[DNA count]];
    
    for(int i = 0; i < unchangedGenesCount; i++)
        [changeFlags addObject:[NSNumber numberWithBool:NO]];
    
    for(int i = 0; i < genesToChangeCount; i++)
        [changeFlags insertObject:[NSNumber numberWithBool:YES] atIndex:rand() % [changeFlags count]];
        
    for(int i = 0; i < [DNA count]; i++)
        if([[changeFlags objectAtIndex:i] boolValue])
            [[DNA objectAtIndex:i] mutate];
}

@end

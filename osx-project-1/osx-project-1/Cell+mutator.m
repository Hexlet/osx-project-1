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
    long genesToChangeCount = [[self DNA] count] * percentage / 100;
    
    NSMutableArray* genes = [NSMutableArray arrayWithArray:[self DNA]];
    while(genesToChangeCount > 0)
    {
        Gene* gene = [genes objectAtIndex:(rand() % [genes count])];
        
        [gene mutate];
        [genes removeObject:gene];
        
        genesToChangeCount -= 1;
    }
}

@end

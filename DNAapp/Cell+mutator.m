//
//  Cell+mutator.m
//  DNAapp
//
//  Created by Michael Krinitsky on 11/17/12.
//  Copyright (c) 2012 Michael Krinitsky. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void) mutate:(int)perc
{
    NSMutableArray *replaced_items;
    replaced_items = [[NSMutableArray alloc] init];
    int current_rand = 0;
    while ([replaced_items count] <= perc)
    {
        current_rand = abs((int)arc4random()) % 100;
        if (![replaced_items containsObject:[NSNumber numberWithUnsignedInt:current_rand]])
        {
            [replaced_items addObject:[NSNumber numberWithUnsignedInt:current_rand]];
            [DNA replaceObjectAtIndex:current_rand withObject:[[self class] randomAmino]];
        }
    }
    NSLog(@"mutation complete");
}

@end

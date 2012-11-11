//
//  Cell+Mutator.m
//  DNA
//
//  Created by Sergey Buravtsov on 11/11/12.
//  Copyright (c) 2012 -. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void)mutate:(int) percentage {

    NSMutableArray *mutatedBlocks = [NSMutableArray array];
    
    while (mutatedBlocks.count < percentage) {
    
        NSUInteger mutationIndex = arc4random_uniform(DNA_LENGTH);
        if (! [mutatedBlocks containsObject:[NSNumber numberWithUnsignedInteger:mutationIndex]]) {
            
            NSUInteger dnaBlockIndex = arc4random_uniform(4);
            [self.DNA replaceObjectAtIndex:mutationIndex withObject:[dnaBlocksValues objectAtIndex:dnaBlockIndex]];
            
            [mutatedBlocks addObject:[NSNumber numberWithUnsignedInteger:mutationIndex]];
        }
        
    }
}

@end

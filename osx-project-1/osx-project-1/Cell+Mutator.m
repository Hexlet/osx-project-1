//
//  Cell+Mutator.m
//  osx-project-1
//
//  Created by HexletStudent13 on 10/31/12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void) mutate:(int)percent{
    if(percent > 0 && percent <= 100){
        // Calculate number of chars for mutation
        NSUInteger countMutableChars = ceilf((self.DNA.count * percent) / 100.0f);
        
        // Create set for storing non repeatable random indexes
        NSMutableSet *mutationIndexes = [NSMutableSet setWithCapacity:countMutableChars];
        while (mutationIndexes.count < countMutableChars) {
            // Generate random index and add it to the set if index not exist
            NSNumber *index = [NSNumber numberWithInt:(arc4random() % self.DNA.count)];
            if(![mutationIndexes containsObject:index]){
                [mutationIndexes addObject:index];
                // Generate a new char and replace it in the DNA array
                NSString *newChar = [self mutateChar:[self.DNA objectAtIndex:index.intValue]];
                [self.DNA replaceObjectAtIndex:index.intValue withObject:newChar];
            }
        }
    }
}

// Generate random char different from the other one
- (NSString*) mutateChar: (NSString*) oldChar{
    NSString *newChar = [NSString stringWithString: oldChar];
    while([oldChar isEqualToString:newChar]){
        newChar = [self randomDnaChar];
    }
    return newChar;
}

@end

//
//  Cell+mutator.m
//  DNA
//
//  Created by Mihail Onoprienko on 3.11.12.
//  Copyright (c) 2012 Mihail Onoprienko. All rights reserved.
//

#import "Cell+mutator.h"
#import "NSMutableArray+Shuffling.h"

@implementation Cell (mutator)
-(void) mutate : (int) percent {
    // Create array [0, 1, 2, 3, 4 ... 99] and shuffle it.
    // First N elements of this array will be N random indexes.
    
    NSMutableArray *randomIndexes = [NSMutableArray arrayWithCapacity:[self.DNA count]];
    for (int i = 0; i < [self.DNA count]; i++) {
        [randomIndexes insertObject:[NSNumber numberWithInt:i] atIndex:i];
    }
    
    [randomIndexes shuffle];
    
    // Mutate
    
    for (int i = 0; i < percent; i++) {
        int randomIndex = (int) [[randomIndexes objectAtIndex:i] integerValue];
        
        NSString* oldBase = [self.DNA objectAtIndex:randomIndex];
        NSString* newBase = [Cell randomBaseExcept:oldBase];
        [self.DNA replaceObjectAtIndex:randomIndex withObject: newBase];
    }
}
@end

//
//  NSMutableArray+Shuffling.m
//  DNA
//
//  Created by Sergey Mitskevich on 11/5/12.
//  Copyright (c) 2012 Sergey Mitskevich. All rights reserved.
//

#import "NSMutableArray+Shuffling.h"

@implementation NSMutableArray (Shuffling)

// Taken from http://stackoverflow.com/questions/56648/whats-the-best-way-to-shuffle-an-nsmutablearray
- (void) shuffle {
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end

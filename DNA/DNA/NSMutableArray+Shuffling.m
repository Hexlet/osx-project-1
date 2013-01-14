//
//  NSMutableArray+Shuffling.m
//  arrayRandoom
//
//  Created by vladimir on 14.01.13.
//  Copyright (c) 2013 Владимир Ковалев. All rights reserved.
//

#import "NSMutableArray+Shuffling.h"

@implementation NSMutableArray (Shuffling)
- (void)shuffle
{
    NSUInteger count = [self count];
    NSMutableArray *copy = [self mutableCopy];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    if([self isEqual:copy]) {
        [self shuffle];
    }
}
@end

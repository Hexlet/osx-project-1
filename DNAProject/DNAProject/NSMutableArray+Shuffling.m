//
//  NSMutableArray+Shuffling.m
//  DNAProject
//
//  Created by Valery Kharshats on 11/8/12.
//  Copyright (c) 2012 Valery Kharshats. All rights reserved.
//

#import "NSMutableArray+Shuffling.h"

@implementation NSMutableArray (Shuffling)

- (void) shuffle {
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger quantity = count - i;
        NSInteger n = (arc4random() % quantity) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end

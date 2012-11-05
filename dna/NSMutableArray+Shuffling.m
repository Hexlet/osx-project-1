//
//  NSMutableArray+Shuffling.m
//  dna
//
//  Created by Anton Osenenko on 11/5/12.
//  Copyright (c) 2012 Anton Osenenko. All rights reserved.
//

#import "NSMutableArray+Shuffling.h"

@implementation NSMutableArray (Shuffling)

- (void)shuffle
{
    for (int i = 0; i < self.count; ++i)
    {
        int nElements = (int)self.count - i;
        int n = arc4random_uniform(nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end

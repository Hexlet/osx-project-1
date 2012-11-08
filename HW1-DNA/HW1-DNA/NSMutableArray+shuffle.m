//
//  NSMutableArray+shuffle.m
//  HW1-DNA
//
//  Created by Victor Gafiatulin on 05.11.12.
//  Copyright (c) 2012 Victor Gafiatulin. All rights reserved.
//

#import "NSMutableArray+shuffle.h"

@implementation NSMutableArray (shuffle)
-(void)shuffle
{
    int count = (int)[self count];
    for (int i = 0; i < count; ++i)
    {
        int nElements = count - i;
        NSInteger n = arc4random_uniform((unsigned int)nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end

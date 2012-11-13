//
//  NSMutableArray+Shuffle.m
//  DNA
//
//  Created by n on 13.11.12.
//  Copyright (c) 2012 n. All rights reserved.
//

#import "NSMutableArray+Shuffle.h"

@implementation NSMutableArray (Shuffle)
-(void) shuffle
{
    for (NSInteger i = 0; i < [self count] - 1; i++)
    {
        [self exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform((int)([self count]-i)) + i];
    }
}
@end

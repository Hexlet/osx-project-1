//
//  NSMutableArray+Shuffling.m
//  DNK
//
//  Created by Danil Galeev on 05.11.12.
//  Copyright (c) 2012 Danil Galeev. All rights reserved.
//

#import "NSMutableArray+Shuffling.h"

@implementation NSMutableArray (Shuffling)

-(void)shuffle
//Метод для случайного перемешивания NSMutableArray
{
    NSUInteger count = [self count];
    for (NSInteger i = 0; i < count; ++i) {
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end

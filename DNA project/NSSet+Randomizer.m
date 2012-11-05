//
//  NSSet+Randomizer.m
//  DNA project
//
//  Created by Sergey Starukhin on 02.11.12.
//  Copyright (c) 2012 Sergey Starukhin. All rights reserved.
//

#import "NSSet+Randomizer.h"

@implementation NSSet (Randomizer)

// Метод возвращает случайный элемент множества
- (id)randomObject {
    NSArray *objects = [self allObjects];
    return [objects objectAtIndex:arc4random_uniform((uint32_t)objects.count)];
}

@end

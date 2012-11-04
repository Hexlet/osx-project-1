//
//  Random.m
//  Project1-DNA
//
//  Created by Administrator on 01.11.12.
//  Copyright (c) 2012 Mykhailo Oleksiuk. All rights reserved.
//

#import "Random.h"

@implementation Random

+ (int)randomInteger:(int)upperBound {
    return arc4random_uniform(upperBound);
}

+ (NSSet *)uniqueRandomIntegersWithSize:(int)size upperBound:(int)upperBound {
    NSMutableSet *resultSet = [NSMutableSet setWithCapacity:size];
    
    do {
        [resultSet addObject:[NSNumber numberWithInt:[Random randomInteger:upperBound]]];
    } while ([resultSet count] != size);
        
    return resultSet;
}

@end

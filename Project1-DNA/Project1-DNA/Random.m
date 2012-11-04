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
    if (upperBound < 0) {
        @throw [NSException exceptionWithName:@"IllegalArgumentException" reason:@"Upperbound value can't be negative" userInfo:nil];
    }
    return arc4random_uniform(upperBound);
}

+ (NSSet *)uniqueRandomIntegersWithSize:(int)size upperBound:(int)upperBound {
    if (upperBound < 0) {
        @throw [NSException exceptionWithName:@"IllegalArgumentException" reason:@"Size value can't be negative" userInfo:nil];
    }
    
    if (upperBound < 0) {
        @throw [NSException exceptionWithName:@"IllegalArgumentException" reason:@"Upperbound value can't be negative" userInfo:nil];
    }
    
    NSMutableSet *resultSet = [NSMutableSet setWithCapacity:size];
    
    do {
        [resultSet addObject:[NSNumber numberWithInt:[Random randomInteger:upperBound]]];
    } while ([resultSet count] != size);
        
    return resultSet;
}

@end

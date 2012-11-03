//
//  Random.m
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import "Random.h"

@implementation Random

+ (NSUInteger) nextNumber:(NSUInteger)upperBound {
    if (upperBound <= 0) { return 0; }
    return (NSUInteger)(arc4random() % upperBound);
}

+ (NSOrderedSet *) nextSequenceOfLength:(NSUInteger)length
                  withUpperBound:(NSUInteger)upperBound {
    NSMutableArray *possibleNumbers = [NSMutableArray arrayWithCapacity:upperBound];
    for (int n = 0; n < upperBound; n++) {
        possibleNumbers[n] = @(n);
    }
    NSMutableOrderedSet *result = [NSMutableOrderedSet orderedSet];
    for (int i = 0; i < length; i++) {
        NSUInteger numbersLeft = possibleNumbers.count;
        if (numbersLeft == 0) { break; }
        NSUInteger index = [Random nextNumber:numbersLeft];
        [result addObject:possibleNumbers[index]];
        [possibleNumbers removeObjectAtIndex:index];
    }
    return result;
}


@end

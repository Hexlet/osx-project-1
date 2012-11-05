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
    if (upperBound == 0) { return NSNotFound; }
    return (NSUInteger)(arc4random() % upperBound);
}

+ (NSUInteger) nextNumberExcept:(NSUInteger)exceptNumber withUpperBound:(NSUInteger)upperBound {
    if (exceptNumber >= upperBound) {
        return [Random nextNumber:upperBound];
    }
    NSUInteger randomShift = [Random nextNumber:upperBound - 1];
    if (randomShift == NSNotFound) {
        return NSNotFound;
    }
    return (exceptNumber + 1 + randomShift) % upperBound;
}

+ (NSIndexSet *) nextSequenceOfLength:(NSUInteger)length withUpperBound:(NSUInteger)upperBound {
    NSMutableArray *possibleNumbers =  [self arrayWithRangeOfLength:upperBound];
    NSMutableIndexSet *result = [NSMutableIndexSet indexSet];
    for (int i = 0; i < length; i++) {
        NSUInteger numbersLeft = possibleNumbers.count;
        if (numbersLeft == 0) { break; }
        NSUInteger index = [Random nextNumber:numbersLeft];
        [result addIndex:[possibleNumbers[index] intValue]];
        [possibleNumbers removeObjectAtIndex:index];
    }
    return result;
}

+ (NSMutableArray *) arrayWithRangeOfLength:(NSUInteger)length {
    NSMutableArray *numbers = [NSMutableArray arrayWithCapacity:length];
    for (int n = 0; n < length; n++) {
        numbers[n] = @(n);
    }
    return numbers;
}

@end

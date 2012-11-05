//
//  RandomTest.m
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import "RandomTest.h"
#import "Random.h"

@implementation RandomTest

- (void) test_nextNumberForBound10ReturnsNumberFrom0To9 {
    for (int i = 0; i < 100; i++) {
        NSUInteger number = [Random nextNumber:10];
        STAssertTrue(number >= 0, nil);
        STAssertTrue(number < 10, nil);
    }
}

- (void) test_nextNumberForBound0ReturnsNSNotFound {
    NSUInteger number = [Random nextNumber:0];
    STAssertEquals((NSUInteger)NSNotFound, number, nil);
}

- (void) test_nextNumberForBound2IsUniform {
    int onesCount = 0;
    for (int i = 0; i < 100; i++) {
        NSUInteger number = [Random nextNumber:2];
        onesCount += number % 2;
    }
    STAssertTrue(onesCount > 10, nil);
    STAssertTrue(onesCount < 90, nil);
}

- (void) test_nextNumberExceptNumberGreaterThanBoundReturnsNumberFrom0ToBound {
    for (int i = 0; i < 100; i++) {
        NSUInteger number = [Random nextNumberExcept:100 withUpperBound:3];
        STAssertTrue(number >= 0, nil);
        STAssertTrue(number < 3, nil);
    }
}

- (void) test_nextNumberExceptNSNotFoundReturnsNumberFrom0ToBound {
    for (int i = 0; i < 100; i++) {
        NSUInteger number = [Random nextNumberExcept:NSNotFound withUpperBound:2];
        STAssertTrue(number >= 0, nil);
        STAssertTrue(number < 2, nil);
    }
}

- (void) test_nextNumberExcept1WithBound3Returns0Or2 {
    for (int i = 0; i < 100; i++) {
        NSUInteger number = [Random nextNumberExcept:1 withUpperBound:3];
        STAssertTrue(number == 0 || number == 2, nil);
    }
}

- (void) test_nextNumberExcept0WithBound2Returns1 {
    for (int i = 0; i < 100; i++) {
        NSUInteger number = [Random nextNumberExcept:0 withUpperBound:2];
        STAssertEquals((NSUInteger)1, number, nil);
    }
}

- (void) test_nextNumberExcept0WithBound1ReturnsNSNotFound {
    for (int i = 0; i < 100; i++) {
        NSUInteger number = [Random nextNumberExcept:0 withUpperBound:1];
        STAssertEquals((NSUInteger)NSNotFound, number, nil);
    }
}

- (void) test_nextSequenceWithLength0ReturnsEmptySet {
    NSIndexSet *set = [Random nextSequenceOfLength:0 withUpperBound:100];
    STAssertEquals((NSUInteger)0, set.count, nil);
}

- (void) test_nextSequenceWithLength5AndBound10Contains5NumbersFrom0To9 {
    for (int i = 0; i < 100; i++) {
        NSIndexSet *set = [Random nextSequenceOfLength:5 withUpperBound:10];
        STAssertEquals((NSUInteger)5, set.count, nil);
        NSUInteger index = set.firstIndex;
        while (index != NSNotFound) {
            STAssertTrue(index >= 0, nil);
            STAssertTrue(index < 10, nil);
            index = [set indexGreaterThanIndex:index];
        }
    }
}

- (void) test_nextSequenceWithLengthWhenLengthGreaterThanBoundsReturnsCutSequence {
    for (int i = 0; i < 100; i++) {
        NSIndexSet *set = [Random nextSequenceOfLength:4 withUpperBound:3];
        STAssertEquals((NSUInteger)3, set.count, nil);
        STAssertTrue([set containsIndex:0], nil);
        STAssertTrue([set containsIndex:1], nil);
        STAssertTrue([set containsIndex:2], nil);
    }
}

@end

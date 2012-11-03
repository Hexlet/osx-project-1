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

- (void) test_nextNumberForBound0Returns0 {
    NSUInteger number = [Random nextNumber:0];
    STAssertEquals((NSUInteger)0, number, nil);
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


@end

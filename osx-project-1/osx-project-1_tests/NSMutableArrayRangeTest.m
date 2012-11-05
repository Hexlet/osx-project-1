//
//  NSMutableArrayRangeTest.m
//  osx-project-1
//
//  Created by Igor on 05/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import "NSMutableArrayRangeTest.h"
#import "NSMutableArray+Range.h"

@implementation NSMutableArrayRangeTest

- (void) test_arrayWithRangeWithNonemptyRange {
    NSMutableArray *array = [NSMutableArray arrayWithRange:NSMakeRange(1, 3)];
    STAssertEquals((NSUInteger)3, array.count, nil);
    for (int i = 0; i < 3; i++) {
        STAssertTrue([array[i] isKindOfClass:[NSNumber class]], nil);
        STAssertEquals(i+1, [array[i] intValue], nil);
    }
}

- (void) test_arrayWithRangeWithEmptyRangeReturnsEmptyArray {
    NSMutableArray *array = [NSMutableArray arrayWithRange:NSMakeRange(0, 0)];
    STAssertEquals((NSUInteger)0, array.count, nil);
}

@end

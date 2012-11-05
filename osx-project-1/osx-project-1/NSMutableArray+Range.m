//
//  NSMutableArray+Range.m
//  osx-project-1
//
//  Created by Igor on 05/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import "NSMutableArray+Range.h"

@implementation NSMutableArray (Range)

+ (NSMutableArray *) arrayWithRange:(NSRange)range {
    NSMutableArray *array = [NSMutableArray array];
    for (NSUInteger i = 0; i < range.length; i++) {
        array[i] = @(i + range.location);
    }
    return array;
}

@end

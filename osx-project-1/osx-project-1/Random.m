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

@end

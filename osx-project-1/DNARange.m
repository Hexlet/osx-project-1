//
//  DNARange.m
//  osx-project-1
//
//  Created by Pavel Nikitin on 11/4/12.
//  Copyright (c) 2012 Pavel Nikitin. All rights reserved.
//

#import "DNARange.h"

@implementation DNARange

-(id) init {
    self = [super init];
    [self setRange: @[@"A", @"T", @"G", @"C"]];
    return self;
}

-(id) randomElement {
    return [[self range] objectAtIndex: arc4random() % [[self range] count]];
}

-(id) randomButNot:(id)excludeElement {
    while (YES) {
        id randomElementAttempt = [self randomElement];
        if (excludeElement != randomElementAttempt) {
            return randomElementAttempt;
        }
    }
}

@end

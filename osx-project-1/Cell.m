//
//  Cell.m
//  osx-project-1
//
//  Created by Alexandr on 11/4/12.
//  Copyright (c) 2012 Alexandr. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    int size = 100;
    
    if (self = [super init]) {
        _DNA = [NSMutableArray arrayWithCapacity:size];
        _dnaVariants = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        
        for (int i = 0; i < size; i++) {
            [_DNA setObject:self.randomElement atIndexedSubscript:i];
        }
    }
    
    return self;
}

- (int) hammingDistance:(Cell *)compare {
    if ([_DNA count] != [compare.DNA count]) {
        return -1;
    }
    
    int distance = 0;
    
    for (int i = 0; i < _DNA.count; i++) {
        if ([_DNA objectAtIndex:i] != [compare.DNA objectAtIndex:i]) {
            distance++;
        }
    }
    
    return distance;
}

- (NSString*) randomElement {
    int r = arc4random_uniform((uint)_dnaVariants.count);
    return [_dnaVariants objectAtIndex: r];
}

@end

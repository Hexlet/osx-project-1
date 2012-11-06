//
//  Cell.m
//  project1
//
//  Created by Василий Слепцов on 01.11.12.
//  Copyright (c) 2012 Василий Слепцов. All rights reserved.
//

#import "Cell.h"

@implementation Cell
- (id)init {
    self = [super init];
    if (self) {
        _DNA = [[NSMutableArray alloc] initWithCapacity:100];
        NSMutableArray *objects = [[NSMutableArray alloc] initWithObjects:@"A", @"T", @"G", @"С", nil];
        int i;
        for (i = 0; i < 100; i++) {
            [_DNA addObject: [objects objectAtIndex:arc4random() % 4]];
        }
    }
    return self;
}

- (int) hammingDistance:(Cell *)hamm {
    int count = 0;
    for (int i = 0; i < 100; i++) {
        if ([_DNA objectAtIndex:i] == [[hamm DNA] objectAtIndex:i]) {
            count++;
        }
    }
    return count;
}
@end

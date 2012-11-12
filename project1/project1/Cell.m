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
        Length = 100;
        _DNA = [[NSMutableArray alloc] initWithCapacity:Length];
        objects = [[NSMutableArray alloc] initWithObjects:@"A", @"T", @"G", @"С", nil];
        int i;
        for (i = 0; i < Length; i++) {
            [_DNA addObject: [self getRandom]];
        }
    }
    return self;
}

- (int) hammingDistance:(Cell *)hamm {
    int count = 0;
    for (int i = 0; i < Length; i++) {
        if ([_DNA objectAtIndex:i] == [[hamm DNA] objectAtIndex:i]) {
            count++;
        }
    }
    return count;
}

-(NSString*) getRandom {
    int random_id = arc4random() % 3;
    return [objects objectAtIndex:random_id];
}

@end

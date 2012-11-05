//
//  Cell.m
//  osx-project-1
//
//  Created by Роман Евсеев on 05.11.12.
//  Copyright (c) 2012 Роман Евсеев. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    if (self = [super init]) {
        _DNA = [[NSMutableArray alloc] init];
        for (int i=0; i<100; i++) {
            [_DNA addObject:[Cell randomElement]];
        }
    }
    return self;
}

- (int) hammingDistance:(Cell *)cell {
    int diffCount = 0;
    
    for (int i=0; i<100; i++) {
        if ([_DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i]) {
            diffCount++;
        }
    }
    return diffCount;
}

+ (NSString *)randomElement {
    NSArray * elements = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    return [elements objectAtIndex:arc4random() % [elements count]];
}

@end

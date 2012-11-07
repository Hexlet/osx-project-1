//
//  Cell.m
//  osx-project-1
//
//  Created by qqq qqq on 11/6/12.
//  Copyright (c) 2012 qqq qqq. All rights reserved.
//

#import "Cell.h"

int const CELL_SIZE = 10;

@implementation Cell

-(id) init {
    self = [super init];
    
    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:3];

    [tmp addObject:@"A"];
    [tmp addObject:@"T"];
    [tmp addObject:@"G"];
    [tmp addObject:@"C"];
    
    if (self) {
        int i;
        NSLog(@"Init %d", arc4random_uniform(3));
        _DNA = [NSMutableArray arrayWithCapacity:CELL_SIZE];
        for (i = 0; i < CELL_SIZE; i++) {
            [_DNA addObject:[tmp objectAtIndex:arc4random_uniform(4)]];
        }
    }
    
    return self;
}

-(void) print {
    NSLog(@"%@", [_DNA componentsJoinedByString: @" "]);
}

-(int) hammingDistance:(Cell *)subject {
    int distance = 0;

    for (int i = 0; i < CELL_SIZE; i++) {
        NSString *literal = [_DNA objectAtIndex:i];
        NSString *subject_literal = [subject.DNA objectAtIndex:i];
        
        if (literal != subject_literal) {
            distance++;
        }
    }
    return distance;
}
@end

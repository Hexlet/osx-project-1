//
//  Cell.m
//  osx-project-1
//
//  Created by Nikolay Kushin on 06.01.13.
//  Copyright (c) 2013 Nikolay Kushin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

int ELTS_COUNT = 100;

-(id) init {
    self = [super init];
    _ELEMENTS = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    self.DNA = [NSMutableArray arrayWithCapacity:ELTS_COUNT];
    for (int i = 0; i < ELTS_COUNT; i++) {
        [self.DNA setObject:[self.ELEMENTS objectAtIndex: random() % 4] atIndexedSubscript:i];
    }
    return self;
}
-(int) hammingDistance: (Cell*) cell {
    int result = 0;
    for (int i = 0; i < ELTS_COUNT; i++)
        if ([self.DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i])
            result++;
    return result;
}
-(void) print {
    NSLog(@"%@", [self.DNA componentsJoinedByString:@"-"]);
}

@end

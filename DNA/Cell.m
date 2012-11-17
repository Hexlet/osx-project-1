//
//  Cell.m
//  osx-project-1
//
//  Created by qqq qqq on 11/6/12.
//  Copyright (c) 2012 qqq qqq. All rights reserved.
//

#import "Cell.h"

@implementation Cell

+(NSString *) generateCellValue {
    switch (arc4random_uniform(4)) {
        case 0:
            return @"A";
        case 1:
            return @"T";
        case 2:
            return @"G";
        case 3:
            return @"C";
    }
}

-(id) init {
    self = [super init];
    
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:CELL_SIZE];
        for (int i = 0; i < CELL_SIZE; i++) {
            [_DNA addObject:[Cell generateCellValue]];
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



//
//  Cell.m
//  osx-project-1
//
//  Created by qqq qqq on 11/6/12.
//  Copyright (c) 2012 qqq qqq. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// Как правильно создать переменную класса? Или константу класса?
+(NSArray *) cellValues {
    return [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
}

+(NSString *) generateCellValue {
    return [[self cellValues] objectAtIndex:arc4random_uniform(CELL_VALUE_SIZE)];
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



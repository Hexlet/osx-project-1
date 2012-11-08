//
//  Cell.m
//  hexlet-osx-project-1
//
//  Created by Admin on 9/11/12.
//  Copyright (c) 2012 litvak.su. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        // number of elements in a cell
        const int ELEMENTS_COUNT = 100;
        // symbols that are used to fill DNA
        const NSArray *dnaStrings = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        // instantiate mutable array object
        _DNA = [NSMutableArray arrayWithCapacity:ELEMENTS_COUNT];
        // instantiate
                for (int i = 0; i < ELEMENTS_COUNT; i++) {
            [_DNA addObject: [dnaStrings objectAtIndex:(arc4random() % 4)]];
        }
    }
    return self;
}

-(void) print {
    NSLog(@"%@", _DNA);
}

@end

//
//  Cell.m
//  DNA
//
//  Created by Dmitry Davidov on 04.11.12.
//  Copyright (c) 2012 Dmitry Davidov. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    NSMutableArray *DNA;
}

-(id) init {
    self = [super init];
    if (self) {
        int COUNT = 100;
        NSMutableArray *VALUES = [NSMutableArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        
        DNA = [NSMutableArray arrayWithCapacity: COUNT];
        
        for (int i = 0; i < COUNT; ++i) {
            [DNA addObject: [VALUES objectAtIndex: rand() % [VALUES count]]];
        }
    }
    return self;
}

-(void) print {
    NSLog(@"%@", DNA);
}

@end

//
//  Cell.m
//  osx-project-1
//
//  Created by wtf on 11/11/12.
//  Copyright (c) 2012 on. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    
    _DNA = [NSMutableArray arrayWithCapacity:100];
    _NB = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    
    for (int i = 0; i < 100; i++) {
        [_DNA addObject:[_NB objectAtIndex:[[NSNumber numberWithInt:arc4random() & 3] integerValue]]];
    }
    return self;
}

-(int) hammingDistance:(Cell *)c {
    int counter = 0;
    for (int i = 0; i < 100; i++) {
        if ([_DNA objectAtIndex:i] != [c.DNA objectAtIndex:i]) {
            counter++;
        }
    }
    return counter;    
}

-(void) print {
    NSLog(@"%@", [_DNA componentsJoinedByString:@""]);
}

@end

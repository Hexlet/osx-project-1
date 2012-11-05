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
        
        DNA = [NSMutableArray arrayWithCapacity:COUNT];
        
        for (int i = 0; i < COUNT; ++i)
            [self randomizeAt:i];
    }
    return self;
}

-(NSMutableArray *) getDNA {
    return DNA;
}

-(void) randomizeAt:(NSInteger)index {
    NSMutableArray *VALUES = [NSMutableArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    
    if (index >= [DNA count])
        [DNA insertObject:[VALUES objectAtIndex:rand() % [VALUES count]] atIndex:index];
    else {
        id val = [DNA objectAtIndex:index];
        for (int i = 0; i < [VALUES count]; ++i) {
            if ([VALUES objectAtIndex:i] == val) {
                [VALUES removeObjectAtIndex:i];
                break;
            }
        }
        [DNA replaceObjectAtIndex:index withObject:[VALUES objectAtIndex:rand() % [VALUES count]]];
//        NSLog(@"%@ -> %@", val, VALUES);
    }
}

-(int) hammingDistance:(Cell *)cell {
    int diff = 0;
    for (int i = 0; i < [DNA count]; ++i) {
//        NSLog(@"%@ - %@ -> ", [DNA objectAtIndex:i], [[cell getDNA] objectAtIndex:i]);
        if ([DNA objectAtIndex:i] != [[cell getDNA] objectAtIndex:i]) {
            ++diff;
//            NSLog(@"ne");
        }
//        else {
//            NSLog(@"eq");
//        }
    }
    return diff;
}

-(void) print {
    NSLog(@"%@", DNA);
}

@end

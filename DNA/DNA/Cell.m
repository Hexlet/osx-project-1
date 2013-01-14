//
//  Cell.m
//  arrayRandoom
//
//  Created by vladimir on 14.01.13.
//  Copyright (c) 2013 Владимир Ковалев. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    if(self = [super init]) {
        NSArray * n = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
        DNA = [[NSMutableArray alloc] initWithCapacity:100];
        for(int i = 0; i < 100; i++) {
            [DNA addObject:[n objectAtIndex:arc4random()%4]];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)obj {
    NSMutableArray * objDNA = [[obj returnDNA] mutableCopy];
    int distance = 0;
    for (int i = 0; i < 100; i++) {
        if([[DNA objectAtIndex:i] isNotEqualTo:[objDNA objectAtIndex:i]]) {
            distance++;
        }
    }
    return distance;
}

-(NSMutableArray*) returnDNA {
    return DNA;
}

-(NSString *)description {
    return [DNA componentsJoinedByString:@""];
}

@end

//
//  Cell.m
//  Dna
//
//  Created by conference on 22.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        size = 100;
        dnaBitsArray = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
        dnaArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < size; i++) {
            int randInt = (int)(random() % 4);
            [dnaArray addObject:[dnaBitsArray objectAtIndex:randInt]];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell*)obj {
    int countMismatch = 0;
    for (int i = 0; i < size; i++) {
        if ([self getObj:i] != [obj getObj:i])
            countMismatch++;
    }
    return countMismatch;
}

-(NSString*) getObj:(int)index {
    return [dnaArray objectAtIndex:index];
}
@end

//
//  Cell.m
//  dna-project
//
//  Created by Илья Бельский on 11/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <stdlib.h>
#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    
    if (self != nil) {
        int dnaLength = 100;
        dna = [NSMutableArray arrayWithCapacity:dnaLength];
        NSString* acids = @"ATGC";
        
        for (int i=0; i<dnaLength; i++) {
            int randomIndex = arc4random() % [acids length];
            NSString* acid = [NSString stringWithFormat:@"%c", [acids characterAtIndex:randomIndex]];
            [dna addObject:acid];
        }
    }
    return self;
}


- (int) hammingDistance:(Cell *)cell {
    int distance = 0;
    NSArray* otherDna = [cell getDnaAsArray];
    int count = MIN([dna count], [otherDna count]);
    for (int i=0; i<count; i++) {
        if ([dna objectAtIndex:i] != [otherDna objectAtIndex:i]) {
            distance++;
        }
    }
    return distance;
}

- (NSArray *) getDnaAsArray {
    return dna;
}

- (NSString*) getDnaAsString {
    return [dna componentsJoinedByString:@""];
}

@end

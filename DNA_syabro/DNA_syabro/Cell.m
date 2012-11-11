//
//  Cell.m
//  DNA_syabro
//
//  Created by Max Syabro on 07.11.12.
//  Copyright (c) 2012 Max Syabro. All rights reserved.
//
#include <stdlib.h>

#import "Cell.h"

@implementation Cell

- (id) init: (int)len {
    self = [super init];
    [self generateDNA:len];
    return self;
}

- (id) init {
    return [self init:100];
}

- (void) generateDNA: (int)len {
    self.DNA = [[NSMutableArray alloc] init];

    for (int i=0; i<len; i++) {
        [self.DNA addObject:[self getRandomCell]];
    }
}

- (NSString*) getRandomCell {
    NSString *bricks = @"ATGC";
    int r = arc4random() % ((unsigned)[bricks length]);
    return [NSString stringWithFormat:@"%c", [bricks characterAtIndex:r]];
}

- (void) printDNA {
    NSLog([self.DNA componentsJoinedByString:@""]);
};

- (int) hammingDistance: (Cell *)c {
    int distance = 0;
    for (int i=0;i < self.DNA.count; i++){
        if (self.DNA[i]!=c.DNA[i]){
            distance++;
        }
    }
    return distance;
};

@end

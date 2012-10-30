//
//  Cell.m
//  DNAAssighment
//
//  Created by Oleg Langer on 30.10.12.
//  Copyright (c) 2012 Oleg Langer. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    if (self) {
        self.DNA = [NSMutableArray array];
        for (int i = 0; i < 100; i ++) {
            [self.DNA addObject: [self randomSymbol]];
        }
    }
    return self;
}

- (NSString*) randomSymbol {
    static NSString *alphabet = @"ATGC";
    return [NSString stringWithFormat:@"%C", [alphabet characterAtIndex:arc4random() % 4]];
}

- (int) hammingDistance:(Cell *)cell {
    NSAssert(cell.DNA.count == self.DNA.count, @"The length of dna array has to be identic");
    int distance = 0;
    for (int i = 0; i < cell.DNA.count; i++) {
        if ([cell.DNA[i] isEqualToString:self.DNA[i]] )
            distance++;
    }
    return distance;
}

@end

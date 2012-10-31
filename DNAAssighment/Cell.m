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
        self.dna = [NSMutableArray array];
        for (int i = 0; i < 100; i ++) {
            [self.dna addObject: [self randomSymbol]];
        }
    }
    return self;
}

- (NSString*) randomSymbol {
    static NSString *alphabet = @"ATGC";
    return [NSString stringWithFormat:@"%C", [alphabet characterAtIndex:arc4random() % 4]];
}

- (int) hammingDistance:(Cell *)cell {
    NSAssert(cell.dna.count == self.dna.count, @"The length of dna array has to be identic");
    int distance = 0;
    for (int i = 0; i < cell.dna.count; i++) {
        if ([cell.dna[i] isEqualToString:self.dna[i]] )
            distance++;
    }
    return distance;
}

@end

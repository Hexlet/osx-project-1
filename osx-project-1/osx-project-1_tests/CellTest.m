//
//  CellTest.m
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import "CellTest.h"
#import "Cell.h"

@implementation CellTest

- (void) test_init {
    Cell *cell = [[Cell alloc] init];
    STAssertNotNil(cell, nil);
}

- (void) test_hammingDistanceWithSelfReturns0 {
    Cell *cell = [[Cell alloc] init];
    int hammingDistance = [cell hammingDistance:cell];
    STAssertEquals(0, hammingDistance, nil);
}

- (void) test_hammingDistanceWithRandomCellIsBetween1And100 {
    Cell *cell = [[Cell alloc] init];
    for (int i = 0; i < 10; i++) {
        Cell *otherCell = [[Cell alloc] init];
        int hammingDistance = [cell hammingDistance:otherCell];
        STAssertTrue(hammingDistance > 0, nil);
        STAssertTrue(hammingDistance <= 100, nil);
    }
}


@end

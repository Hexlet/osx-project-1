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

- (void) testCellCreated_expectDnaNotNull {
    Cell *cell = [[Cell alloc] init];
    STAssertNotNil(cell, nil);
}

@end

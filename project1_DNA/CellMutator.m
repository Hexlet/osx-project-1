//
//  CellMutator.m
//  project1_DNA
//
//  Created by Alex on 11/2/12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import "CellMutator.h"
#import "Cell.h"

@implementation Cell(Mutator)

-(void) mutate: (int) percents {
    if(percents >= 0 && percents <= 100){
        int changeCount = CELL_CAPACITY * percents / 100;
        
        NSLog(@" chagggg %d", changeCount);
    } else {
        [NSException raise:@"Invalid percents value" format:@"percents must be from 0 to 100, %d entered", percents];
    }
}

@end

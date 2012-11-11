//
//  main.c
//  Project1DNA
//
//  Created by Сергей Петрущенко on 11.11.12.
//  Copyright (c) 2012 NVision Group. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
- (void)mutate:(int)intPercentage;
@end;

@implementation Cell (mutator)
- (void)mutate:(int)intPercentage {
    NSMutableArray *mutatedCellIndexes = [NSMutableArray arrayWithCapacity:intPercentage];

    NSNumber *indexToMutate;
    NSString *cellToMutate;

    for (int i = 0; i < intPercentage; i++) {

        do
            indexToMutate = [NSNumber numberWithInt:arc4random() % 100];
        while ([mutatedCellIndexes containsObject:indexToMutate]);

        [mutatedCellIndexes addObject:indexToMutate];

        do
            cellToMutate = [self randomCell];
        while ([[self.DNA objectAtIndex:[indexToMutate intValue]] isEqualTo:cellToMutate]);

        [self.DNA replaceObjectAtIndex:[indexToMutate intValue] withObject:cellToMutate];

    }
}
@end

int main(int argc, const char *argv[]) {

    Cell *cell1 = [[Cell alloc] init];
    Cell *cell2 = [[Cell alloc] init];

    NSLog(@"\nHamming distance is %d.", [cell1 hammingDistance:cell2]);

    [cell1 mutate:50];
    [cell2 mutate:10];

    NSLog(@"\nHamming distance is %d.", [cell1 hammingDistance:cell2]);

}


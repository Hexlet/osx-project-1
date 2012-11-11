//
//  main.m
//  DNA_syabro
//
//  Created by Max Syabro on 07.11.12.
//  Copyright (c) 2012 Max Syabro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(mutator)
- (void) mutate: (int) amount;
@end

@implementation Cell(mutator)
- (void) mutate:(int)percents {
    if (percents<0) {
        return ;
    }

    if (percents>100) {
        percents = 100;
    }



    int amount = [self.DNA count] * percents / 100;

//    NSLog(@"Replacing %d", amount);

    NSMutableArray *avalailableIndexes = [[NSMutableArray alloc] init];
    NSMutableArray *indexesForReplace = [[NSMutableArray alloc] init];
    for (int i=0; i<[self.DNA count]; i++) {
        [avalailableIndexes addObject:[NSNumber numberWithInt:i]];
    }

    while (amount > 0) {
        // Selecting random available index
        int i = arc4random() % ((unsigned)[avalailableIndexes count]);

        // Saving it for replace
        [indexesForReplace addObject:avalailableIndexes[i]];

        // Removing it from available
        [avalailableIndexes removeObjectAtIndex:i];
        amount--;
    }
//    NSLog([indexesForReplace componentsJoinedByString:@", "]);

    // Replacing selected indexes with random cell;
    for (int i=0; i<[indexesForReplace count]; i++) {
        int index = [indexesForReplace[i] intValue];
        self.DNA[index] = [self getRandomCell:self.DNA[index]];
    }
}
@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];

//        [cell printDNA];
//        [cell2 printDNA];

        NSLog(@"%d", [cell hammingDistance: cell2]);

        [cell mutate:20];
        [cell mutate:20];

//        [cell printDNA];
//        [cell2 printDNA];

        NSLog(@"%d", [cell hammingDistance: cell2]);
    }
    return 0;
}


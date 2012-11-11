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
    int amount = [self.DNA count] * percents / 100;

    // Replacing cells with #
    // We can't replace it with random cell directly, because we can replace one cell twice
    while (amount > 0) {
        int random_cell = arc4random() % ((unsigned)[self.DNA count]);

        if (self.DNA[random_cell]!=@"#") {
            self.DNA[random_cell]=@"#";
            amount--;
        }
    }

    // Replacing # with random cell
    for (int i=0; i<[self.DNA count]; i++) {
        if (self.DNA[i]==@"#"){
            self.DNA[i] = [self getRandomCell];
        }
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

        NSLog(@"%d", [cell hammingDistance: cell2]);
    }
    return 0;
}


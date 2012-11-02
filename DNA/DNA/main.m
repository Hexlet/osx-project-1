//
//  main.m
//  DNA
//
//  Created by Moonkid on 10/31/12.
//  Copyright (c) 2012 Moonkid. All rights reserved.
//

#import "Cell+Mutation.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Cell 1:\t%@", [cell1 description]);
        NSLog(@"Cell 2:\t%@", [cell2 description]);
        NSLog(@"Hamming Distance is \t%i", [cell1 hammingDistance:cell2]);
        while (1) {
            int amount;
            NSLog(@"How many percent of symbols should be replaced?");
            scanf("%i", &amount);
            if ((amount > 0) && (amount <= 100)) {
                NSLog(@"Old cell 1 is:\t%@", [cell1 description]);
                [cell1 mutate:amount];
                NSLog(@"New cell 1 is:\t%@", [cell1 description]);
                NSLog(@"Old cell 2 is:\t%@", [cell2 description]);
                [cell2 mutate:amount];
                NSLog(@"New cell 2 is:\t%@", [cell2 description]);
                NSLog(@"New Hamming Distance is:%i", [cell1 hammingDistance:cell2]);
            }
            else {
                NSLog(@"Invalid amount!");
            }
        }
    }
    return 0;
}


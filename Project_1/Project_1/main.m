//
//  main.m
//  Project_1
//
//  Created by Arseniy Gushin on 03.11.12.
//  Copyright (c) 2012 Arseniy Gushin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Started.");
        
        // create new Cells
        Cell *cellA = [[Cell alloc] init];
        Cell *cellB = [[Cell alloc] init];
        
        NSLog(@"Cell A: '%@'", [cellA stringForGenome]);
        NSLog(@"Cell B: '%@'", [cellB stringForGenome]);
        NSLog(@"Cell A differs from Cell B in %i symbols.", [cellA hammingDistance:cellB]);
        int cellAMutationLimit = [Cell randomInRangeLo:0 toHi:100];
        int cellBMutationLimit = [Cell randomInRangeLo:0 toHi:100];
        [cellA mutate:cellAMutationLimit];
        [cellB mutate:cellBMutationLimit];
        NSLog(@"Cell A mutated %i%%: '%@'", cellAMutationLimit, [cellA stringForGenome]);
        NSLog(@"Cell B mutated %i%%: '%@'", cellBMutationLimit, [cellB stringForGenome]);
        NSLog(@"Cell A differs from Cell B in %i symbols.", [cellA hammingDistance:cellB]);
        
        NSLog(@"Finished.");
    }
    
    return 0;
}


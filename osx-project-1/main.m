//
//  main.m
//  osx-project-1
//
//  Created by Yuriy Zarovnuy on 07.11.12.
//  Copyright (c) 2012 Yuriy Zarovnuy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"
#import "Nucleotide.h"

void mutateCellToRandomPercent(Cell *cell, NSString *message)
{
    int randomMutatePercent = arc4random() % 100;
    [cell mutate: randomMutatePercent];
    NSLog(message, randomMutatePercent);
}

void printHammingDistance(Cell *secondCell, Cell *firstCell, NSString *message)
{
    int hammingDistance = [firstCell hammingDistance: secondCell];
    NSLog(message, hammingDistance);
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *firstCell = [[Cell alloc] init];
        Cell *secondCell = [[Cell alloc] init];
        
        printHammingDistance(secondCell, firstCell, @"Hamming distance to a mutation is %i.");
        
        mutateCellToRandomPercent(firstCell, @"The first cell mutated for %i%%.");
        mutateCellToRandomPercent(secondCell, @"The second cell mutated for %i%%.");
        
        printHammingDistance(secondCell, firstCell, @"Hamming distance after a mutation is %i.");
    }
    
    return 0;
}
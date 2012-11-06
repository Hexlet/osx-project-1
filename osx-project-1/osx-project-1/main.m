//
//  main.m
//  osx-project-1
//
//  Created by Anton Melnikov on 11/6/12.
//  Copyright (c) 2012 Anton Melnikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // Create 2 cells
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Hamming distance before mutation is %d", [cell1 hammingDistanceWith:cell2]);
        
        [cell1 replaceNucleotideAtIndex:110 with:5];
        
        // Mutate both, and recalculate hamming distance
        double mutationRate = 10.0;
        [cell1 mutate:mutationRate];
        [cell2 mutate:mutationRate];
        NSLog(@"Hamming distance after mutation is %d", [cell1 hammingDistanceWith:cell2]);
    }
    return 0;
}


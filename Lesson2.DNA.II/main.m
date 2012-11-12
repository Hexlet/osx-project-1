//
//  main.m
//  Lesson2.DNA.II
//
//  Created by DS on 11/6/12.
//  Copyright (c) 2012 DS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // Create and init two cells
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        
        // Print cells
        NSLog(@"Cell1:%@", [cell1 asString]);
        NSLog(@"Cell2:%@", [cell2 asString]);
        
        // Calc and print a hamming distance
        int distance = [cell1 hammingDistance:cell2];
        NSLog(@"hDistance = %d", distance);
        
        // Mutate two cells
        [cell1 mutate:10]; // 10% mutation
        [cell2 mutate:20]; // 20% mutation
        
        // Print mutated cells
        NSLog(@"Cell1:%@", [cell1 asString]);
        NSLog(@"Cell2:%@", [cell2 asString]);
        
        // Calc and print new hamming distance
        distance = [cell1 hammingDistance:cell2];
        NSLog(@"hDistance = %d", distance);
    }
    return 0;
}


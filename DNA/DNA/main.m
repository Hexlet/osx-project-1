//
//  main.m
//  DNA
//
//  Created by Alexander Tyaglov on 31.10.12.
//  Copyright (c) 2012 Alexander Tyaglov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // Create first cell.
        Cell *cell1 = [Cell cell];
        NSLog(@"Cell1 DNA:");
        [cell1 print];

        // Create second cell.
        Cell *cell2 = [Cell cell];
        NSLog(@"Cell2 DNA:");
        [cell2 print];
        
        // Print Hamming distance.
        NSLog(@"Hamming distance: %i", [cell1 hammingDistance:cell2]);

        // Mutate first cell.
        [cell1 mutate:42];
        NSLog(@"Cell1 DNA (mutated):");
        [cell1 print];
 
        // Mutate second cell.
        [cell2 mutate:42];
        NSLog(@"Cell2 DNA (mutated):");
        [cell2 print];

        // Print Hamming distance after mutation.
        NSLog(@"Hamming distance after mutation: %i", [cell1 hammingDistance:cell2]);
        
        
        // Hamming distance and mutating test.
        NSLog(@"\n\nHamming distance and mutating test.");
        
        // Create third cell (first cell clone).
        Cell *cell3 = [Cell cellWithCell:cell1];
        NSLog(@"Cell3 DNA:");
        [cell1 print];
        
        // Mutate third cell.
        [cell3 mutate:66];
        NSLog(@"Cell3 DNA (mutated):");
        [cell3 print];
 
        // Print Hamming distance after mutation of clone.
        NSLog(@"Hamming distance after clone mutation: %i", [cell1 hammingDistance:cell3]);
    }
    return 0;
}
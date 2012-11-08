//
//  main.m
//  DNAProject
//
//  Created by Admin on 11/2/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Create first DNA
        Cell *cell1 = [[Cell alloc] init];
        NSLog(@"First cell: ");
        [cell1 print];
        
        // Create second DNA
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Second cell: ");
        [cell2 print];
        
        // Calc humming distance
        int distance = [cell1 hammingDistance: cell2];
        
        NSLog(@"Humming distance: %i", distance);
        
        // Percent of nucleotides to mutate
        int percent = 10;
        
        // Mutate first cell
        [cell1 mutate: percent];
        NSLog(@"First cell after mutation %i%%: ",percent);
        [cell1 print];
        
        
        // Mutate second cell
        [cell2 mutate: percent];
        NSLog(@"Second cell after mutation %i%%: ", percent);
        [cell2 print];
        
        // Calc hamming distance
        distance = [cell1 hammingDistance: cell2];
        
        NSLog(@"Humming distance: %i", distance);
    }
    return 0;
}


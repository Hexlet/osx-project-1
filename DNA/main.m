//
//  main.m
//  DNA
//
//  Created by Sergey Mitskevich on 11/4/12.
//  Copyright (c) 2012 Sergey Mitskevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init];
        NSLog(@"cell1:");
        [cell1 logDNA];
        cell2 = [[Cell alloc] init];
        NSLog(@"cell2:");
        [cell2 logDNA];
        
        NSLog(@"Hamming distance: %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:50];
        NSLog(@"Mutated cell1:");
        [cell1 logDNA];
        NSLog(@"Hamming distance: %i", [cell1 hammingDistance:cell2]);

        [cell2 mutate:50];
        NSLog(@"Mutated cell2:");
        [cell2 logDNA];
        NSLog(@"Hamming distance: %i", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}


//
//  main.m
//  hexlet_dna
//
//  Created by Misha Shchetinin on 31.10.12.
//  Copyright (c) 2012 Misha Shchetinin. All rights reserved.
//
#include <stdlib.h>

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)

-(void) mutate: (int)x;

@end

@implementation Cell (Mutator)

-(void)mutate: (int) x {
    int uniqueIndexes[x];
    int r_number = 0, i=0;
    // generation if unique indexes for raplacement;
    while (i < x) {
        r_number = arc4random() % 100;
        if (uniqueIndexes[i] != r_number) {
            uniqueIndexes[i] = r_number;
            i += 1;
        }
    }
    // replace random nucleotids
    for(i=0; i<x; i++){
        self.dnaArray[uniqueIndexes[i]] = [self randomNucleotid];
    }
    
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1;
        Cell *cell2;
        
        cell1 = [[Cell alloc]init];
        cell2 = [[Cell alloc]init];
        
        [cell1 hammingDistance:cell2];
        
        [cell1 mutate:15];
        [cell2 mutate:15];
        
        [cell1 hammingDistance:cell2];
        
    }
    return 0;
}


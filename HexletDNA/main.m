//
//  main.c
//  HexletDNA
//
//  FINAL
//  Created by 4pcbr on 11/1/12.
//  Copyright (c) 2012 4pcbr. All rights reserved.
//

#include <stdio.h>
#include "Cell.h"
#include "Cell+mutator.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"Initial hamming distance: %i", [cell1 hammingDistance:cell2]);
        
        int muting_volume = 30; // 30% компонент мутируют каждый цикл
        
        NSLog(@"Mutation...");
        
        NSLog(@"Initial cell DNA: %@", [cell1 toString]);
        [cell1 mutate:muting_volume];
        NSLog(@"Mutated cell DNA: %@", [cell1 toString]);

        
        NSLog(@"Initial cell DNA: %@", [cell2 toString]);
        [cell2 mutate:muting_volume];
        NSLog(@"Mutated cell DNA: %@", [cell2 toString]);
        
        NSLog(@"Renewed hamming distance: %i", [cell1 hammingDistance:cell2]);
    }
    
    return 0;
}


//
//  main.m
//  DNA
//
//  Created by Алексей on 12.11.12.
//  Copyright (c) 2012 Алексей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        NSLog(@"Различий до мутации: %i", [cell1 hammingDistance:(cell2)]);
        [cell1 mutate:20];
        [cell2 mutate:20];
        NSLog(@"Различий после мутации: %i", [cell1 hammingDistance:(cell2)]);
        
        
        Cell *cell =[[Cell alloc] init];
        Cell *cellCopy = [cell copy];
        NSLog(@"hamming distance before = %d", [cell hammingDistance:cellCopy]);
        [cell mutate:23];
        NSLog(@"hamming distance after = %d", [cell hammingDistance:cellCopy]);
    }
    return 0;
}


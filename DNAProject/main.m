//
//  main.m
//  DNAProject
//
//  Created by Denys Volokh on 1/11/12.
//  Copyright (c) 2012 Denys Volokh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutate.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"Cell #1 %@", [cell1 toString]);
        NSLog(@"Cell #2 %@", [cell2 toString]);
        
        NSLog(@"Hamming Distance %d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:70];
        [cell2 mutate:40];
        
        NSLog(@"Cell #1 Mutated %@", [cell1 toString]);
        NSLog(@"Cell #1 Mutated %@", [cell2 toString]);
        
        NSLog(@"Hamming distance after mutation %d", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


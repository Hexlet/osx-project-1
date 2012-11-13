//
//  main.m
//  DNA
//
//  Created by Akki on 11/10/12.
//  Copyright (c) 2012 Akki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Cell *cell_1 = [[Cell alloc] init];
        Cell *cell_2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance before mutation: %d", [cell_1 hammingDistance:cell_2]);
        
        NSLog(@"Random mutation.");
        int mutation_factor_1 = arc4random() & 100;
        int mutation_factor_2 = arc4random() & 100;
        NSLog(@"Cell #1 mutation percetage:%d\nCell #2 mutation percetage:%d", mutation_factor_1, mutation_factor_2);
        
        [cell_1 mutate:mutation_factor_1];
        [cell_2 mutate:mutation_factor_2];
        
        NSLog(@"Hamming distance after mutation: %d", [cell_1 hammingDistance:cell_2]);
    }
    return 0;
}


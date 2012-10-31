//
//  main.m
//  DNA
//
//  Created by xxsnakerxx on 30.10.12.
//  Copyright (c) 2012 xxsnakerxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *dna1 = [[Cell alloc] init];
        Cell *dna2 = [[Cell alloc] init];
        
        [dna1 print];
        [dna2 print];
        
        NSLog(@"Hamming distance = %d.\n\n", [dna1 hammingDistance:dna2]);
        
        [dna1 mutate:10];
        [dna2 mutate:50];
        
        [dna1 print];
        [dna2 print];
        
        NSLog(@"Hamming distance = %d.", [dna1 hammingDistance:dna2]);
        
    }
    return 0;
}


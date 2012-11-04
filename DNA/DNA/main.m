//
//  main.m
//  DNA
//
//  Created by Gennadii Lukash on 10/31/12.
//  Copyright (c) 2012 GL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *dna_1, *dna_2;
        int percentForMutate = 50;
 
        dna_1 = [[Cell alloc] init];
        dna_2 = [[Cell alloc] init];

            NSLog(@"\n Normal Hamming Distance is %d", [dna_1 hammingDistance: dna_2]);
        
            [dna_1 mutate: percentForMutate];
            [dna_2 mutate: percentForMutate];
        
            NSLog(@"\n Mutated Hamming Distance is %d", [dna_1 hammingDistance: dna_2]);
  
        
        
    }
    return 0;
}


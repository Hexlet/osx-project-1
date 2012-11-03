//
//  main.m
//  dna
//
//  Created by Igor Pavlov on 02.11.12.
//  Copyright (c) 2012 Igor Pavlov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutator.h"


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        int distance;

        Cell *a = [[Cell alloc] init];
        Cell *b = [[Cell alloc] init];
        
        //Cell *at = [a clone];
        //Cell *bt = [b clone];
        
        //NSLog(@"DNA-a: %@", [a toString]);
        //NSLog(@"DNA-b: %@", [b toString]);
     
        distance = [a hammingDistance:b];
        NSLog(@"Hamming distance before mutate: %i", distance);

        [a mutate:47];
        [b mutate:53];

        //distance = [a hammingDistance:at];
        //NSLog(@"Hamming distance a-at: %i", distance);

        //distance = [b hammingDistance:bt];
        //NSLog(@"Hamming distance b-bt: %i", distance);
        
        //NSLog(@"DNA-a: %@", [a toString]);
        //NSLog(@"DNA-b: %@", [b toString]);
        
        distance = [a hammingDistance:b];
        NSLog(@"Hamming distance after mutate: %i", distance);
    }
    
    return 0;
}

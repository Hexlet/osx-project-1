//
//  main.m
//  dna
//
//  Created by Igor Pavlov on 02.11.12.
//  Copyright (c) 2012 Igor Pavlov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        int distance;

        Cell *a = [[Cell alloc] init];
        Cell *b = [[Cell alloc] init];
        
        //[a print];
        //[b print];
        
        distance = [a hammingDistance:b];
        NSLog(@"Hamming distance before mutate: %i", distance);
        
        [a mutate:37];
        [b mutate:53];
        
        //[a print];
        //[b print];
        
        distance = [a hammingDistance:b];
        NSLog(@"Hamming distance after mutate: %i", distance);
    }
    
    return 0;
}

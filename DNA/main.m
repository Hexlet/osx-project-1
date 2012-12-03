//
//  main.m
//  DNA
//
//  Created by Nik on 05.11.12.
//  Copyright (c) 2012 Nik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


int main(int argc, const char * argv[]) {

    @autoreleasepool {
        Cell *dna1, *dna2;
        dna1 = [[Cell alloc] init];
        dna2 = [[Cell alloc] init];
     
        [dna1 print];
        [dna2 print];

        
        NSLog(@"HammingDistance=%d\n\n",[dna1 hammingDistance:dna2]);
        
        [dna1 mutate:20];
        [dna2 mutate:30];
        
        
        [dna1 print];
        [dna2 print];
        
        NSLog(@"HammingDistance=%d",[dna1 hammingDistance:dna2]);
        
        
    }
    return 0;
}


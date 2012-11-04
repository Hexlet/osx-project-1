//
//  main.m
//  DNK
//
//  Created by someone on 11/1/12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *myDNA_A = [[Cell alloc] init];
        Cell *myDNA_B = [[Cell alloc] init];
        
        NSLog(@"Hamming distance between original DNAs is %i", [myDNA_A hammingDistance:myDNA_B]);
        
        [myDNA_A mutate:21];
        [myDNA_B mutate:10];
                
        NSLog(@"Hamming distance between mutated DNAs is %i", [myDNA_A hammingDistance:myDNA_B]);
        
    }
    
    return 0;
}


//
//  main.m
//  DNA
//
//  Created by Vlad on 03.11.12.
//  Copyright (c) 2012 Vlad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance = %i",[cell1 hammingDistance:cell2]);
        NSLog(@"Hamming distance = %i",[cell2 hammingDistance:cell1]);
                
        [cell1 mutate:50];
        [cell2 mutate:50];
        
        NSLog(@"Hamming distance = %i",[cell1 hammingDistance:cell2]);
        NSLog(@"Hamming distance = %i",[cell2 hammingDistance:cell1]);    
        
    }
    return 0;
}


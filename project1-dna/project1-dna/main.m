//
//  main.m
//  project1-dna
//
//  Created by DaZzz on 02.11.12.
//  Copyright (c) 2012 DaZzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance before mutations: %i", [cell1 hammingDistanceTo:cell2]);
        
        [cell1 mutate: 100];
        [cell2 mutate: 50];
        
        NSLog(@"Hamming distance after mutations: %i", [cell1 hammingDistanceTo:cell2]);
    }
    return 0;
}


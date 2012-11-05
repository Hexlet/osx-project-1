//
//  main.m
//  DNA
//
//  Created by Cyxx on 03.11.12.
//  Copyright (c) 2012 Cyxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cellA = [[Cell alloc] init];
        Cell *cellB = [[Cell alloc] init];
        [cellA print];
        [cellB print];

        printf("Hamming Distance = %d\n", [cellA hammingDistance:cellB]);
        
        printf("\nMutating...\n\n");

        [cellA mutate:40];
        [cellB mutate:40];
        [cellA print];
        [cellB print];
        printf("Hamming Distance = %d\n", [cellA hammingDistance:cellB]);
    }
    return 0;
}


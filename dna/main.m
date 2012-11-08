//
//  main.m
//  dna
//
//  Created by Anton Osenenko on 11/4/12.
//  Copyright (c) 2012 Anton Osenenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"hamming distance before: %i", [cell1 hammingDistance:cell2]);
        [cell1 mutate:70];
        [cell2 mutate:30];
        NSLog(@"hamming distance after: %i", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


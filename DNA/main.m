//
//  main.m
//  DNA
//
//  Created by Dm on 10/30/12.
//  Copyright (c) 2012 Dm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"
#import "NSMutableArray+Shuffling.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Hamming Distance Between DNAs is %i",[cell1 hammingDistance:cell2]);
        [cell1 mutate:10];
        [cell2 mutate:50];
        NSLog(@"Hamming Distance Between Mutated DNAs is %i",[cell1 hammingDistance:cell2]);
    }
    return 0;
}


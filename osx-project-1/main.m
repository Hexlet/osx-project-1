//
//  main.m
//  osx-project-1
//
//  Created by undelalune on 31.10.12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char *argv[])
{
    @autoreleasepool
    {
        Cell *cell = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];

        NSLog(@"Hamming distance = %i", [cell hammingDistance:cell2]);

        [cell mutate:45];
        [cell2 mutate:45];

        NSLog(@"Hamming distance = %i", [cell hammingDistance:cell2]);
    }
    return 0;
}

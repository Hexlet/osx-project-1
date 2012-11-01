//
//  main.m
//  Project1DNA
//
//  Created by TT on 31.10.12.
//  Copyright (c) 2012 TT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Hamming distance before mutation: %d", [cell1 hammingDistance:cell2]);
        [cell1 mutate:10];
        [cell2 mutate:30];
        NSLog(@"Hamming distance after mutation: %d", [cell1 hammingDistance:cell2]);
        [cell1 release];
        [cell2 release];
    }
    return 0;
}


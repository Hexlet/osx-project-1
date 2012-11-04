//
//  main.m
//  DNA
//
//  Created on 03.11.12.
//  Copyright (c) 2012 hexlet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        NSLog(@"First hamming distance: %ld \n", [cell1 hammingDistance: cell2]);
        [cell1 mutate: 20];
        [cell2 mutate: 100];
        NSLog(@"Second hamming distance: %ld \n", [cell1 hammingDistance: cell2]);
    }
    return 0;
}


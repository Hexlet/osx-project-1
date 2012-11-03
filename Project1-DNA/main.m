//
//  main.m
//  Project1-DNA
//
//  Created by Bogdan Pankiv on 11/3/12.
//  Copyright (c) 2012 Bogdan Pankiv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"First hamming distance: %d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:30];
        [cell2 mutate:70];
        
        NSLog(@"Second hamming distance: %d", [cell1 hammingDistance:cell2]);

    }
    return 0;
}


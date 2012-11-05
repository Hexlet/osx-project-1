//
//  main.m
//  dna
//
//  Created by Konstantin Tumalevich on 31.10.12.
//  Copyright (c) 2012 Konstantin Tumalevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell, *cell2;
        
        cell = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];

        NSLog(@"distance: %d", [cell hammingDistance:cell2]);
        
        NSLog(@"Do the evolution!");
        
        [cell mutate:40];
        [cell2 mutate:50];
        
        NSLog(@"distance: %d", [cell hammingDistance:cell2]);
    }
    return 0;
}


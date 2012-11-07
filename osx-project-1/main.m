//
//  main.m
//  osx-project-1
//
//  Created by sergeich on 07.11.12.
//  Copyright (c) 2012 sergeich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance: %d", [cell1 hammingDistance:cell2]);

        [cell1 mutate:15];
        [cell2 mutate:42];
        
        NSLog(@"Hamming distance after mutating: %d", [cell1 hammingDistance:cell2]);
    }
    return 0;
}
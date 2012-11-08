//
//  main.m
//  DNA
//
//  Created by user on 11/6/12.
//  Copyright (c) 2012 azhohov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        int hammingDistance = [cell1 hammingDistance:cell2];
        
        NSLog(@"Before mutation:");
        NSLog(@"cell1 = %@", cell1);
        NSLog(@"cell2 = %@", cell2);
        NSLog(@"hamming distance = %d", hammingDistance);
        
        [cell1 mutate: 100];
        [cell2 mutate: 25];
        hammingDistance = [cell1 hammingDistance:cell2];

        NSLog(@"After mutation:");
        NSLog(@"cell1 = %@", cell1);
        NSLog(@"cell2 = %@", cell2);
        NSLog(@"hamming distance = %d", hammingDistance);
        
    }
    return 0;
}


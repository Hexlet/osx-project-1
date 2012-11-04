//
//  main.m
//  DNA
//
//  Created by Arkadiy Pikalov on 10/31/12.
//  Copyright (c) 2012 Arkadiy Pikalov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+CellMutator.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *first = [[Cell alloc] init];
        [first generateDNA];
        [first print];

        Cell *second = [[Cell alloc] init];
        [second generateDNA];
        
        NSLog(@"hamming distance: %d",[first hammingDistance:second]);

        [first mutate:10];
        [second mutate:60];
        
        NSLog(@"hamming distance: %d",[first hammingDistance:second]);
        
    }
    return 0;
}


//
//  main.m
//  project1_DNA
//
//  Created by Alex on 11/1/12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "CellMutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1;
        Cell *cell2;
        
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        NSLog(@"Hamming Distance 1: %d", [cell1 hammingDistance:cell2]);
        
        @try {
            [cell1 mutate: 50];
            [cell2 mutate: 34];
        }
        @catch (NSException *exception) {
            NSLog(@"%@", exception);
        }

        NSLog(@"Hamming Distance 2: %d", [cell1 hammingDistance:cell2]);
        
        
    }
    return 0;
}


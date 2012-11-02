//
//  main.m
//  hexlet-project1
//
//  Created by Alexey Karguine on 01.11.12.
//  Copyright (c) 2012 Alexey Karguine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "CellMutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance 1: %i",[cell1 hammingDistance:cell2]);
        
        [cell1 mutate:arc4random() % DNALength];
        [cell2 mutate:arc4random() % DNALength];
        
        NSLog(@"Hamming distance 2: %i",[cell1 hammingDistance:cell2]);
                
    }
    return 0;
}


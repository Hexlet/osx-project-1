//
//  main.m
//  DNAProject
//
//  Created by Maxim Tushevskiy on 05.11.12.
//  Copyright (c) 2012 Maxim Tushevskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Hamming distance: %d",[cell1 hammingDistance: cell2]);
        [cell1 mutate:15];
        [cell2 mutate:25];
        NSLog(@"Hamming distance after mutate: %d",[cell1 hammingDistance: cell2]);
    }
    return 0;
}


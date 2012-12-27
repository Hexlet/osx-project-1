//
//  main.m
//  osx-project-1
//
//  Created by Murat Temirov on 26.12.12.
//  Copyright (c) 2012 Murat Temirov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellMutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Cell *cell1= [[Cell alloc]init];
        Cell *cell2= [[Cell alloc]init];
        
        int distance = [cell1 hammingDistance:cell2];
        NSLog(@"hamming distance before mutate = %i", distance);
        [cell1 mutate:70];
        [cell2 mutate:50];
        distance = [cell1 hammingDistance:cell2];
        NSLog(@"hamming distance after mutate = %i", distance);
        
    }
    return 0;
}


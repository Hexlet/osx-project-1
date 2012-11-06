//
//  main.m
//  DNA
//
//  Created by Eraser on 11/4/12.
//  Copyright (c) 2012 Eraser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "CellMutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {      
        Cell *aCell = [[Cell alloc] init];
        Cell *bCell = [[Cell alloc] init];
        
//        [aCell print];
//        [bCell print];
        
        NSLog(@"Hamming distance = %i", [aCell hammingDistance: bCell]);
      
        [aCell mutate: 33];
        [bCell mutate: 67];
        
//        [aCell print];
//        [bCell print];
        
        NSLog(@"New hamming distance = %i", [aCell hammingDistance: bCell]);
    }
    
    return 0;
}


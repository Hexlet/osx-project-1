//
//  main.m
//  DNA
//
//  Created by Daniel Kurapov on 11/2/12.
//  Copyright (c) 2012 Daniel Kurapov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "CellOperations.h"

// Main program

int main(int argc, const char * argv[])
{
    
    @autoreleasepool
    {
        Cell *x_DNA, *y_DNA;
        x_DNA = [[Cell alloc]init];
        y_DNA = [[Cell alloc]init];
        
        [x_DNA hammingDistance:y_DNA];
        
        [x_DNA mutate:25];
        [y_DNA mutate:10];
        
        [x_DNA hammingDistance:y_DNA];
    }
    return 0;
}


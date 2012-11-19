//
//  main.m
//  DNA
//
//  Created by Vitaly Dyachkov on 11/4/12.
//  Copyright (c) 2012 Vitaly Dyachkov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *firstCell = [[Cell alloc] init];
        Cell *secondCell = [[Cell alloc] init];
        
        NSLog(@"Hamming distance between cells before mutating is %d", [firstCell hammingDistance:secondCell]);
        
        [firstCell mutate:10];
        [secondCell mutate:20];
        
        NSLog(@"Hamming distance between cells after mutating is %d", [firstCell hammingDistance:secondCell]);
    }
    return 0;
}


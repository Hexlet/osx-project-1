//
//  main.m
//  DNA
//
//  Created by Arthur Belous on 05.11.12.
//  Copyright (c) 2012 Arthur Belous. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *runCell = [[Cell alloc] init];
        [runCell init];
        [runCell hammingDistance:DNA]; // I do cknow is it right !?
        
       
    }
    return 0;
} 


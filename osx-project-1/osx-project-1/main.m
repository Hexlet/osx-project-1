//
//  main.m
//  osx-project-1
//
//  Created by mac mini on 04.11.12.
//  Copyright (c) 2012 hexlet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell* firstCell = [[Cell alloc] init];
        Cell* secondCell = [[Cell alloc] init];
        NSLog(@"Hamming distance before mutate is %i",[firstCell hammingDistance:secondCell]);
        [firstCell mutate:0];
        [secondCell mutate:0];
        NSLog(@"Hamming distance after mutate is %i",[firstCell hammingDistance:secondCell]);
    }
    return 0;
}


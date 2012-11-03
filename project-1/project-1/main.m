//
//  main.m
//  project-1
//
//  Created by Pryshchepa Andrew  on 11/3/12.
//  Copyright (c) 2012 Pryshchepa Andrew . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Cell *firstCell = [[Cell alloc] init];
        Cell *secondCell = [[Cell alloc] init];
        
        NSLog(@"%d", [firstCell hammingDistance:secondCell]);
        [firstCell mutate:50];
        [secondCell mutate:50];
        NSLog(@"%d", [firstCell hammingDistance:secondCell]);
    }
    return 0;
}


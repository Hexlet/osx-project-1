//
//  main.m
//  DNA
//
//  Created by Sergey Buravtsov on 11/11/12.
//  Copyright (c) 2012 -. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Cell *firstCell = [[Cell alloc] init];
        Cell *secondCell = [[Cell alloc] init];
        
        NSLog(@"Initial hammingDistance: %d", [firstCell hammingDistanceWith:secondCell]);
        
        [firstCell mutate:20];
        [secondCell mutate:40];
        
        NSLog(@"Final hammingDistance: %d", [firstCell hammingDistanceWith:secondCell]);
        
        
    }
    return 0;
}


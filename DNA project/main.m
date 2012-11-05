//
//  main.m
//  DNA project
//
//  Created by Sergey Starukhin on 01.11.12.
//  Copyright (c) 2012 Sergey Starukhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *firstCell, *secondCell;
        firstCell = [[Cell alloc] init];
        secondCell = [[Cell alloc] init];
        NSLog(@"hamming distance before mutation:%d", [firstCell hammingDistance:secondCell]);
        [firstCell mutate:78];
        [secondCell mutate:94];
        NSLog(@"hamming distance after mutation:%d", [firstCell hammingDistance:secondCell]);
        
    }
    return 0;
}


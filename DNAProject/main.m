//
//  main.m
//  DNAProject
//
//  Created by Eugene Dymov on 31.10.12.
//  Copyright (c) 2012 Eugene Dymov. All rights reserved.
//

#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Cell *cell = [[Cell alloc] init];
        Cell *nextCell = [[Cell alloc] init];

        NSLog(@"\n\ncell1: %@\ncell2: %@\n\nhamming distance:%d", cell, nextCell, [cell hammingDistance:nextCell]);

        [cell mutate:100];
        [nextCell mutate:42];

        NSLog(@"\n\ncell1: %@\ncell2: %@\n\nhamming distance:%d", cell, nextCell, [cell hammingDistance:nextCell]);

    }
    return 0;
}


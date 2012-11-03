//
//  main.m
//  DNAProject
//
//  Created by Vitaly on 31.10.12.
//  Copyright (c) 2012 Vitaly Petrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"%i",[cell1 hammingDistance:cell2]);
        [cell1 mutate:20];
        [cell2 mutate:30];
        NSLog(@"%i",[cell1 hammingDistance:cell2]);
    }
    return 0;
}


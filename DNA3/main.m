//
//  main.m
//  DNA3
//
//  Created by Igor Nikonov on 03.11.12.
//  Copyright (c) 2012 ngoro. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Cell.h"
#include "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1;
        cell1 = [[Cell alloc ] init];
        NSLog(@"%@", cell1);
        
        Cell *cell2;
        cell2 = [[Cell alloc] init];
        NSLog(@"%@", cell2);
        
        NSLog(@"distance %d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:10];
        [cell2 mutate:20];
        NSLog(@"distance %d", [cell1 hammingDistance:cell2]);

    }
    return 0;
}


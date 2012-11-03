//
//  main.m
//  DNA
//
//  Created by Vadim Iskuchekov on 02.11.12.
//  Copyright (c) 2012 Egregors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"hammingDistance = %d",[cell1 hammingDistance:cell2]);
        
        [cell1 mutate:10];
        [cell2 mutate:100];
        
        NSLog(@"hammingDistance = %d",[cell1 hammingDistance:cell2]);
        
    }
    return 0;
}


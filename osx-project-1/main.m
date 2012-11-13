//
//  main.m
//  osx-project-1
//
//  Created by Aleksey Laletin on 13.11.12.
//  Copyright (c) 2012 alexion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance: %d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:13];
        [cell2 mutate:42];
        
        NSLog(@"Mutate hamming distance: %d", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}


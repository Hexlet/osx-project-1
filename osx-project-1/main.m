//
//  main.m
//  osx-project-1
//
//  Created by Nikolay Kushin on 06.01.13.
//  Copyright (c) 2013 Nikolay Kushin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        srandom((int)time(NULL));
        
        Cell *cell1 = [[Cell alloc] init];
        [cell1 print];
        
        Cell *cell2 = [[Cell alloc] init];
        [cell2 print];
        
        NSLog(@"hammingDistance = %i", [cell1 hammingDistance: cell2]);
        
        [cell1 mutate:100];
        [cell2 mutate:100];

        NSLog(@"hammingDistance2 = %i", [cell1 hammingDistance: cell2]);
        
    }
    return 0;
}


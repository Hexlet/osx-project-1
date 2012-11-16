//
//  main.m
//  Project 1 - DNA
//
//  Created by Artemati on 08.11.12.
//  Copyright (c) 2012 Artemati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1;
        Cell *cell2;
        
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
       
        NSLog(@"\nHamming distance %d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:20];
        [cell2 mutate:80];
        
        NSLog(@"\nHamming distance with mutation %d", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}


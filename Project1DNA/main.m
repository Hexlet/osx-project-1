//
//  main.m
//  Project1DNA
//
//  Created by ky391 on 11/8/12.
//  Copyright (c) 2012 ky391. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // first cell
        Cell *cell1 = [[Cell alloc] init];
        
        //[cell1 print];
        
        // second cell
        Cell *cell2 = [[Cell alloc] init];
        
        //[cell2 print];
        
        // print hamming distance
        NSLog(@"%i", [cell1 hammingDistance:cell2]);

        // mutate first cell
        [cell1 mutate: 30];
    
        // mutate second cell
        [cell2 mutate: 50];

        // print hamming distance of mutated cells
        NSLog(@"%i", [cell1 hammingDistance:cell2]);

    }
    return 0;
}


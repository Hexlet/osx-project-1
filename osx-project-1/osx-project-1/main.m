//
//  main.m
//  osx-project-1
//
//  Created by Alex Pulichkin on 06.11.12.
//  Copyright (c) 2012 Alex Pulichkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+MutateCell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        int mutationPercent = 15;
        // insert code here...
        NSLog(@"Program Start!");
        
        Cell *cell = [[Cell alloc]init];
        Cell *cell2 = [[Cell alloc]init];
        NSLog(@"Hamming Distance before mutate: %i",[cell hammingDistance:cell2]);
        
        NSLog(@"Mutate cells...");
        [cell mutate:mutationPercent];
        [cell2 mutate:mutationPercent];
        
        NSLog(@"Hamming Distance after mutate: %i",[cell hammingDistance:cell2]);
        
    }
    return 0;
}


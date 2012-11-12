//
//  main.m
//  osx-project-1
//
//  Created by qqq qqq on 11/6/12.
//  Copyright (c) 2012 qqq qqq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell, *cellSubject;
        cell = [[Cell alloc] init];
        cellSubject = [[Cell alloc] init];
        
        NSLog(@"Hamming distance: %d", [cell hammingDistance:cellSubject]);
        
        [cell mutate:20];
        [cellSubject mutate:20];
                
        NSLog(@"Hamming distance: %d", [cell hammingDistance:cellSubject]);
    }
    return 0;
}


//
//  main.m
//  osx-project-1
//
//  Created by Tkachenko Vitalii on 11/1/12.
//  Copyright (c) 2012 Sanitariumlab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // init cells
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        [cell1 print];
        [cell2 print];
        
        // calculate hamming distance
        int hammingDistance = [cell1 hammingDistance:cell2];
        NSLog(@"%i", hammingDistance);
        
        // mutate
        [cell1 mutator:83];
        [cell2 mutator:37];
        [cell1 print];
        [cell2 print];
        
        // calculate hamming distance after mutate
        hammingDistance = [cell1 hammingDistance:cell2];
        NSLog(@"%i", hammingDistance);
    }
    return 0;
}


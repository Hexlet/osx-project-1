//
//  main.m
//  osx-project-1
//
//  Created by Alexandr on 11/4/12.
//  Copyright (c) 2012 Alexandr. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1, *cell2;
        
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        NSLog(@"Initial Hamming Distance is %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:25];
        [cell2 mutate:75];
        
        NSLog(@"Hamming Distance after Mutate is %i", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


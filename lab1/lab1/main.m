//
//  main.m
//  lab1
//
//  Created by diana shumskaya on 11/3/12.
//  Copyright (c) 2012 diana shumskaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [Cell new];
        Cell *cell2 = [Cell new];
        
        NSLog(@"Hamming distance before mutate is %i", [cell1 hammingDistance:cell2]);
        
        NSLog(@"Mutate 50 percent cell1");
        [cell1 mutate:50];
        NSLog(@"Mutate 13 percent cell2");
        [cell2 mutate:13];
        
        NSLog(@"Hamming distance after mutate is %i", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}


//
//  main.m
//  Project1
//
//  Created by sashkam on 30.10.12.
//  Copyright (c) 2012 Verveyko Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        Cell *myCell1 = [[Cell alloc] init];
        Cell *myCell2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance before mutate is %i", [myCell1 hammingDistance:myCell2]);
        
        NSLog(@"Mutate Cell 1 ...");
        [myCell1 mutate:10];
        NSLog(@"Mutate Cell 2 ...");
        [myCell2 mutate:15];
        
        NSLog(@"Hamming distance after mutate is %i", [myCell1 hammingDistance:myCell2]);
    
    }
    return 0;
}


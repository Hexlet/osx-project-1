//
//  main.m
//  DNA
//
//  Created by ilya on 11/2/12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutate.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int hamming;
        
        Cell *myCell = [[Cell alloc] init];
        Cell *hammingCell = [[Cell alloc] init];
        
        hamming = [myCell hammingDistance: hammingCell];
        
        NSLog(@"hammingDistance: %i", hamming);
        
        [myCell mutate: 30];
        [hammingCell mutate: 40];
        
        hamming = [myCell hammingDistance: hammingCell];
        
        NSLog(@"hammingDistanceAfterMutate: %i", hamming);
        
    }
    return 0;
}


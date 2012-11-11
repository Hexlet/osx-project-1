//
//  main.m
//  DNA
//
//  Created by Evgeny on 04.11.12.
//  Copyright (c) 2012 Evgeny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Mutate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int hamming;
        
        Cell *myCell = [[Cell alloc] init];
        Cell *hammingCell = [[Cell alloc] init];
        
        hamming = [myCell hammingDistance: hammingCell];
        
        NSLog(@"hamming: %i", hamming);
        
        [myCell mutate: 20];
        [hammingCell mutate: 40];
        hamming = [myCell hammingDistance: hammingCell];
        
        NSLog(@"hammingDistanceAfterMutate: %i", hamming);
    }
    return 0;
}


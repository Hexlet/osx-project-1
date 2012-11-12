//
//  main.m
//  hw1
//
//  Created by admin on 11/12/12.
//  Copyright (c) 2012 admin. All rights reserved.
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
        
        [myCell mutate: 30];
        [hammingCell mutate: 50];
        hamming = [myCell hammingDistance: hammingCell];
        
        NSLog(@"hammingDistanceAfterMutate: %i", hamming);
    }
    return 0;
}
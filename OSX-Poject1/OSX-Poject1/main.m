//
//  main.m
//  OSX-Poject1
//
//  Created by keks keksovich on 05.11.12.
//  Copyright (c) 2012 DoZator Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int hamming_distance;
        
        Cell *dnk1 = [[Cell alloc] init];
        Cell *dnk2 = [[Cell alloc] init];

        
        hamming_distance = [dnk1 hammingDistance:dnk2];
        
        NSLog(@"Hamming distance is: %d", hamming_distance);
        
        [dnk1 mutate:30];
        [dnk2 mutate:25];
        
        hamming_distance = [dnk1 hammingDistance:dnk2];
        
        NSLog(@"Hamming distance after mutate is: %d", hamming_distance);
        
    }
    return 0;
}


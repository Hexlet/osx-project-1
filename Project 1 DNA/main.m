//
//  main.m
//  Project 1 DNA
//
//  Created by bashtannik on 03.11.12.
//  Copyright (c) 2012 bashtannik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *c = [[Cell alloc] init];
        Cell *c2 = [[Cell alloc] init];
        
        // NSLog(@"Cell #1: %@",[c.DNA description]);
        // NSLog(@"Cell #2: %@",[c2.DNA description]);
        NSLog(@"Hamming Distance: %@",[[NSNumber numberWithUnsignedInteger:[c2 hammingDistance:c]] stringValue]);
        
        [c mutate:50];
        [c2 mutate:50];
        
        NSLog(@"Hamming Distance after mutation: %@",[[NSNumber numberWithUnsignedInteger:[c2 hammingDistance:c]] stringValue]);
       
    }
    return 0;
}


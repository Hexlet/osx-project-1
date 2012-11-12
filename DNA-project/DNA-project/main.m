//
//  main.m
//  DNA-project
//
//  Created by Sergey Gorelov on 04.11.12.
//  Copyright (c) 2012 Sergey Gorelov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *c1 = [[Cell alloc] init];
        Cell *c2 = [[Cell alloc]init];
        NSLog(@"Cell #1: %@", [c1 dna]);
        NSLog(@"Cell #2: %@", [c2 dna]);
        NSLog(@"hammingDistance: %i",[c1 hammingDistance:c2]);
        [c1 mutate:50];
        [c2 mutate:50];
        NSLog(@"After mutation");
        NSLog(@"Cell #1: %@", [c1 dna]);
        NSLog(@"Cell #2: %@", [c2 dna]);
        NSLog(@"hammingDistance: %i",[c1 hammingDistance:c2]);
        
        
        
    }
    return 0;
    
}


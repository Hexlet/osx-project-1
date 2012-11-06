//
//  main.m
//  DNA
//
//  Created by Roman Zhovnirchyk on 2012-11-04.
//  Copyright (c) 2012 Roman Zhovnirchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        Cell *myDNA1, *myDNA2;
        myDNA1 = [[Cell alloc] init];
        myDNA2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance between two DNAs is %i", [myDNA1 hammingDistance: myDNA2]);
        
        [myDNA1 mutate:0];
        [myDNA2 mutate:50];
        
        NSLog(@"Hamming distance between two mutated DNAs is %i", [myDNA1 hammingDistance: myDNA2]);
        
    }
    return 0;
}


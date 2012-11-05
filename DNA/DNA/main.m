//
//  main.m
//  DNA
//
//  Created by Mac on 01.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {

        Cell *c1 = [[Cell alloc] init];
        Cell *c2 = [[Cell alloc] init];
        [c1 print];
        [c2 print];
        NSLog(@"hamming distance: %d", [c1 hammingDistance:c2]);
        [c1 mutate:30];
        [c2 mutate:50];
        [c1 print];
        [c2 print];
        NSLog(@"hamming distance: %d", [c1 hammingDistance:c2]);
        
    }
    return 0;
}


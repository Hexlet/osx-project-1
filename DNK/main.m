//
//  main.m
//  DNK
//
//  Created by Michael Blinchevsky on 11/4/12.
//  Copyright (c) 2012 aia. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Cell.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell* first = [[Cell alloc] initWithName:@"First"];
        Cell* second = [[Cell alloc] initWithName:@"Second"];
        [first print];
        [second print];
        NSLog(@"hamming distance: %i", [first hammingDistance:second]);
        
        [first mutate:10];
        [second mutate:20];
        NSLog(@"hamming distance after mutation: %i", [first hammingDistance:second]);
        
    }
    return 0;
}


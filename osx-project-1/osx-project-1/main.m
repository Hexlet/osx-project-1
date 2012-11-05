//
//  main.m
//  osx-project-1
//
//  Created by Ivan Ushakov on 11/5/12.
//  Copyright (c) 2012 Ivan Ushakov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        Cell *a = [[Cell alloc] init];
        NSLog(@"Cell A: %@", [a toString]);
        
        Cell *b = [[Cell alloc] init];
        NSLog(@"Cell B: %@", [b toString]);
        
        NSLog(@"Hamming distance from A to B is: %d", [a hammingDistance: b]);
        
        [a mutate: 40];
        [b mutate: 40];
        NSLog(@"Hamming distance (after mutation) from A to B is: %d",
              [a hammingDistance: b]);
    }
    return 0;
}


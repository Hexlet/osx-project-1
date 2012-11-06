//
//  main.m
//  osx-project-1
//
//  Created by Alexander Galato on 06.11.12.
//  Copyright (c) 2012 Alexander Galato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *first, *second;
        first = [[Cell alloc] init];
        second = [[Cell alloc] init];
        
        NSLog(@"Before: %i vs %i", [first hammingDistance:second], [second hammingDistance:first] );
        
        [first mutator:3];
        [second mutator:5];
        
        NSLog(@"After mutation (3,5): %i vs %i", [first hammingDistance:second], [second hammingDistance:first] );
        
    }
    return 0;
}


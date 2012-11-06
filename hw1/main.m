//
//  main.m
//  hw1
//
//  Created by Roman Filippov on 06.11.12.
//  Copyright (c) 2012 Roman Filippov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        Cell *e = [[Cell alloc] init];
        Cell *d = [[Cell alloc] init];
        
        NSLog(@"hamming distance: %ld",[e hammingDistanceWithCell:d]);
        
        [e mutateForPercent:5];
        [d mutateForPercent:9];
        
        NSLog(@"hamming distance after mutation: %ld",[e hammingDistanceWithCell:d]);
        
        [e release];
        [d release];
    }
    return 0;
}


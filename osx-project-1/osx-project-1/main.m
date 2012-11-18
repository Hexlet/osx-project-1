//
//  main.m
//  osx-project-1
//
//  Created by Admin on 11/17/12.
//  Copyright (c) 2012 antonv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        Cell *c1, *c2;
        c1 = [[Cell alloc]init];
        c2 = [[Cell alloc]init];
        
        NSLog(@"difference is %i", [c1 hammingDistance:c2]);
        [c1 mutate: 10];
        [c2 mutate: 10];
        
        
        NSLog(@"difference is %i", [c1 hammingDistance:c2]);
        
    }
    return 0;
}


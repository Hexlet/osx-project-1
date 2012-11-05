//
//  main.m
//  Cells
//
//  Created by Vladimir Korshunov on 11/4/12.
//  Copyright (c) 2012 Vladimir Korshunov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *first = [[Cell alloc] init];
        Cell *second = [[Cell alloc] init];
        NSLog(@"%i", [first hammingDistance:second]);
        
        [first mutate:24];
        [second mutate:42];
        
        NSLog(@"%i", [first hammingDistance:second]);
    }
    return 0;
}


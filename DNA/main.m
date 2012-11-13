//
//  main.m
//  DNA
//
//  Created by Dmytro Chertousov on 12.11.12.
//  Copyright (c) 2012 Dmytro Chertousov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *c1, *c2;
        int x = 10;
        
        // Creating
        c1 = [[Cell alloc] init];
        c2 = [[Cell alloc] init];
        NSLog(@"%i",[c1 hammingDistance:c2]);
        
        // Mutating
        [c1 mutate:x];
        [c2 mutate:x];
        NSLog(@"%i",[c1 hammingDistance:c2]);
    }
    return 0;
}


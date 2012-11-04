//
//  main.m
//  osx-project-1
//
//  Created by Pavel Nikitin on 11/1/12.
//  Copyright (c) 2012 Pavel Nikitin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *myCell = [[Cell alloc] init];
        Cell *anotherCell = [[Cell alloc] init];
        
        NSLog(@"%i", [myCell hammingDistance:anotherCell]);
        
        [myCell mutate:20];
        [anotherCell mutate:40];
        
        NSLog(@"%i", [myCell hammingDistance:anotherCell]);
    }
    return 0;
}


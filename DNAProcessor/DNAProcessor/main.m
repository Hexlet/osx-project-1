//
//  main.m
//  DNAProcessor
//
//  Created by Sergey Nebolsin on 10.11.12.
//  Copyright (c) 2012 Sergey Nebolsin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell = [Cell cell];
        Cell *anotherCell = [Cell cell];

        [cell print];
        [anotherCell print];
        
        NSLog(@"Initial distance: %i", [cell hammingDistance:anotherCell]);
        
        int countToMutate = 5;
        
        [cell mutate:countToMutate];
        [anotherCell mutate:countToMutate];

        NSLog(@"Distance after %i mutations: %i", countToMutate, [cell hammingDistance:anotherCell]);
    }
    return 0;
}


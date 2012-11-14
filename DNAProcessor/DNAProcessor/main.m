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
        Cell *cell = [Cell cellWithLength:5];
        Cell *anotherCell = [Cell cellWithLength:5];

        [cell print];
        [anotherCell print];
        
        NSLog(@"Initial distance: %i", [cell hammingDistance:anotherCell]);
        
        int percentToMutate = 40;
        
        [cell mutate:percentToMutate];
        [anotherCell mutate:percentToMutate];

        [cell print];
        [anotherCell print];

        NSLog(@"Distance after %i%% mutations: %i", percentToMutate, [cell hammingDistance:anotherCell]);
    }
    return 0;
}


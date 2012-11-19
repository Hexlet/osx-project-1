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
        Cell *cell = [Cell cellWithLength:100];
        Cell *anotherCell = [Cell cellWithLength:100];

        NSLog(@"Cell 1 before mutation: %@", cell);
        NSLog(@"Cell 2 before mutation: %@", anotherCell);
        
        NSLog(@"Initial distance: %i", [cell hammingDistance:anotherCell]);
        
        int percentToMutate = 40;
        
        [cell mutate:percentToMutate];
        [anotherCell mutate:percentToMutate];

        NSLog(@"Cell 1 after mutation: %@", cell);
        NSLog(@"Cell 2 after mutation: %@", anotherCell);

        NSLog(@"Distance after %i%% mutations: %i", percentToMutate, [cell hammingDistance:anotherCell]);
    }
    return 0;
}


//
//  main.m
//  DNA
//
//  Created by Anton Platonov on 7.11.12.
//  Copyright (c) 2012 Anton Platonov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Cell.h"
#import "Cell_Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Cell * cellOne = [[Cell alloc] init];
        Cell * cellTwo = [[Cell alloc] init];
        
        NSLog(@"\nHamming distance before mutation: %d", [cellOne hammingDistance:cellTwo]);
        
        [cellOne mutate:100];
        [cellTwo mutate:100];
        
        NSLog(@"\nHamming distance after mutation: %d", [cellOne hammingDistance:cellTwo]);
    }
    return 0;
}

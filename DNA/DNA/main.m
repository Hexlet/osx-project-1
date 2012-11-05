//
//  main.m
//  DNA
//
//  Created by ed on 02.11.12.
//  Copyright (c) 2012 ed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cellDna = [[Cell alloc] init];
        Cell *cellDna2 = [[Cell alloc] init];
        
        NSLog(@"Distance before mutation: %d", [cellDna hammingDistance:cellDna]);
        
        
        [cellDna2 mutate:100];
        
        NSLog(@"Distance after mutation: %d", [cellDna hammingDistance:cellDna2]);
    

            }
    return 0;
}


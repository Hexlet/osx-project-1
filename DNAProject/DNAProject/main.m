//
//  main.m
//  DNA
//
//  Created by Rudometov on 11/6/12.
//  Copyright (c) 2012 Rudometov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {        
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        NSLog(@"hamming distance: %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:20];
        [cell2 mutate:30];
        NSLog(@"hamming distance after mutation: %i", [cell1 hammingDistance:cell2]);       
        
    }
    return 0;
}


//
//  main.m
//  osx-project-1
//
//  Created by Roman TS on 11/2/12.
//  Copyright (c) 2012 Roman TS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell * cellA=[[Cell alloc] init];
        Cell * cellB=[[Cell alloc] init];

        
        NSInteger hammingDistanceValue =[cellA hammingDistance:cellB];
        
        NSLog(@"Hamming distance before mutation %ld", hammingDistanceValue);
        
//        set percent of mutation
        NSUInteger percentOfMutation = 5.2;

//        mutate both cells
        [cellA mutate:percentOfMutation];
        [cellB mutate:percentOfMutation];
        
        hammingDistanceValue =[cellA hammingDistance:cellB];
        NSLog(@"Hamming distance after mutation %ld", hammingDistanceValue);
        
        
    }
    return 0;
}


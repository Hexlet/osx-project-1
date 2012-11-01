//
//  main.m
//  osx-project-1
//
//  Created by Taras Lyapun on 31.10.12.
//  Copyright (c) 2012 Taras Lyapun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell_Mutator.h"

# define MUTATE_PERCENT 25


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        int hamingDistanceBeforeMutation, hamingDistanceAfterMutation;
        
        hamingDistanceBeforeMutation = [cell1 hammingDistance:cell2];
        NSLog(@"Hamming Distance before mutation: %d\n", hamingDistanceBeforeMutation);
        
        [cell1 mutate:MUTATE_PERCENT];
        [cell2 mutate:MUTATE_PERCENT];
        
        hamingDistanceAfterMutation = [cell1 hammingDistance:cell2];
        NSLog(@"Hamming Distance after mutation: %d\n", hamingDistanceAfterMutation);
    }
    return 0;
}
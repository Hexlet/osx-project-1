//
//  main.m
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *firstCell = [[Cell alloc] init];
        Cell *secondCell = [[Cell alloc] init];
        int hammingDistance = [firstCell hammingDistance:secondCell];
        NSLog(@"Hamming distance before mutations: %i.", hammingDistance);
        int mutationPercentage = 20;
        [firstCell mutate:mutationPercentage];
        [secondCell mutate:mutationPercentage];
        hammingDistance = [firstCell hammingDistance:secondCell];
        NSLog(@"Hamming distance after %i%% mutations: %i.", mutationPercentage, hammingDistance);
    }
    return 0;
}


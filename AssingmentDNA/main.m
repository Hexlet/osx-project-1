//
//  main.m
//  AssingmentDNA
//
//  Created by LEV on 30.10.12.
//  Copyright (c) 2012 LEV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //create two Cell objects
        Cell *firstCell;
        Cell *secondCell;
        
        //initialize hammingDistance
        int hammingDistance = 0;
        
        //initialize two Cell objects
        firstCell = [[Cell alloc] init];
        secondCell = [[Cell alloc] init];
        
        //evaluate hammingDistance
        hammingDistance = [firstCell hammingDistance:secondCell];
        
        NSLog(@"Hamming Distance = %i", hammingDistance);
        
        //mutate Cell objects
        [firstCell mutate:50];
        [secondCell mutate:40];
        
        //evaluate new hammingDistance
        hammingDistance = [firstCell hammingDistance:secondCell];
        
        NSLog(@"New Hamming Distance = %i", hammingDistance);
        
    }
    return 0;
}


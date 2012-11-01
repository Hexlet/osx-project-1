//
//  main.m
//  DNA
//
//  Created by Yaroslav Shukharev on 01.11.12.
//  Copyright (c) 2012 krkmetal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell* first_cell = [[Cell alloc] init];
        Cell* second_cell = [[Cell alloc] init];
        
        NSLog(@"Humming distance is %i", [first_cell hummingDistance:second_cell]);
        
        NSLog(@"Mutating 35%% of first_cell...");
        [first_cell mutate:35];
        
        NSLog(@"Mutating 25%% of second_cell...");
        [second_cell mutate:25];
        
        NSLog(@"And now humming distance is %i", [first_cell hummingDistance:second_cell]);
    }
    return 0;
}


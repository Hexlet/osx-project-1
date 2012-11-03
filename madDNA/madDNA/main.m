//
//  main.m
//  madDNA
//
//  Created by Andrey Kolomoets on 02.11.12.
//  Copyright (c) 2012 Andrey Kolomoets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
	@autoreleasepool {
		Cell *first_cell, *second_cell;
		first_cell= [[Cell alloc] init];
		second_cell = [[Cell alloc] init];
		NSLog(@"Hamming distance: %i", [first_cell hammingDistance:second_cell]);
		[first_cell mutate:50];
		[second_cell mutate:50];
		NSLog(@"Hamming distance after mutation: %i", [first_cell hammingDistance:second_cell]);
	}
    return 0;
}


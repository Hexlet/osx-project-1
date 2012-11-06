//
//  main.m
//  HexletProject1
//
//  Created by Dmitry Remesov on 06.11.12.
//  Copyright (c) 2012 Dmitry Remesov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
	srandomdev();

	@autoreleasepool {
	    
	    Cell *cellA = [[Cell alloc] init], *cellB = [[Cell alloc] init];

		NSLog(@"Cell A = %@", cellA);
		NSLog(@"Cell B = %@", cellB);
		NSLog(@"Hamming Distance = %lu", [cellA hammingDistance:cellB]);

		[cellA mutate:70];
		[cellB mutate:70];

		NSLog(@"Cell A = %@", cellA);
		NSLog(@"Cell B = %@", cellB);
		NSLog(@"Hamming Distance = %lu", [cellA hammingDistance:cellB]);

		Cell* cellC = [cellA copy];
		NSLog(@"Cell C = %@", cellC);
		NSLog(@"Hamming Distance for cellC = %lu", [cellA hammingDistance:cellC]);

		[cellC mutate:30];
		NSLog(@"Cell C = %@", cellC);
		NSLog(@"Hamming Distance for cellC = %lu", [cellA hammingDistance:cellC]);

	}
    return 0;
}


//
//  main.m
//  osx-project-1
//
//  Created by MikSer on 01.11.12.
//  Copyright (c) 2012 MikSer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutate.h"

int main(int argc, const char * argv[])
{
    
	@autoreleasepool {
	    
	    Cell *cell1 = [[Cell alloc] init];
		Cell *cell2 = [[Cell alloc] init];
		NSLog(@"Hamming distance: %d", [cell1 hammingDistance:cell2]);
		[cell1 mutate:16];
		[cell2 mutate:44];
		NSLog(@"Hamming distance after mutate: %d", [cell1 hammingDistance:cell2]);
	}
    return 0;
}


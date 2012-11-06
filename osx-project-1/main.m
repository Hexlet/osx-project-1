//
//  main.m
//  osx-project-1
//
//  Created by Serge Kristal on 31.10.12.
//  Copyright (c) 2012 Salakhutdinov Shaukat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
	    Cell *cell1 = [[Cell alloc] init];
		Cell *cell2 = [[Cell alloc] init];
		[cell1 print];
		[cell2 print];
		NSLog(@"--------------------------------");
		
		NSLog(@"Hamming distance: %d", [cell1 hammingDistance:cell2]);
		
		NSLog(@"");
		NSLog(@"--- mutator --------------------");
		
		[cell1 mutate:33];
		[cell2 mutate:75];
		
		NSLog(@"--------------------------------");
		
		NSLog(@"Hamming distance: %d", [cell1 hammingDistance:cell2]);
		
	    
	}
    return 0;
}


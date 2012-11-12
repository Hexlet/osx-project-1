//
//  main.m
//  project1_DNA
//
//  Created by karga7 on 12.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{	
	@autoreleasepool {
		srandom(time(NULL));
		Cell *cell1=[[Cell alloc] init];		
		Cell *cell2=[[Cell alloc] init];
		//[cell1 print];
		//[cell2 print];
		NSLog(@"cell1-cell2 distance=%d",[cell1 hammingDistance:cell2]);
		[cell1 mutate:35];
		[cell2 mutate:35];
		//[cell1 print];
		//[cell2 print];		
		NSLog(@"cell1-cell2 distance=%d",[cell1 hammingDistance:cell2]);

	}
	return 0;
}


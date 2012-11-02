//
//  main.m
//  DnaProject
//
//  Created by wolfmetr on 02.11.12.
//  Copyright (c) 2012 wolfmetr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(mutator)
- (void) mutate:(int)x;
@end

@implementation Cell (mutator)
		
	-(void) mutate:(int) x {
		NSMutableArray *fillRand = [NSMutableArray array];
		int cnt;
		while ([fillRand count] < x) {
			NSNumber *n = [NSNumber numberWithInteger:(arc4random() % [[self DNA] count])]; // 0...99
			
			if (![fillRand containsObject:n]){ // not in array
				[fillRand addObject:n];
				cnt++;
			}
		}
		
		for (int i = 0; i < cnt; i++) {
			[[self DNA] replaceObjectAtIndex:[[fillRand objectAtIndex:i] intValue]
								  withObject:[[self charSet] objectAtIndex:arc4random() % [[self charSet] count]]
			 ];
		}
	}

@end

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
	    Cell *cell1 = [[Cell alloc] init];
		Cell *cell2 = [[Cell alloc] init];
		NSLog(@"Hamming Distance is %i",[cell1 hammingDistance:cell2]);
		[cell1 mutate:12];
		[cell2 mutate:67];
		NSLog(@"Hamming Distance after mutate is %i",[cell1 hammingDistance:cell2]);
	    
	}
    return 0;
}


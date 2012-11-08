//
//  mutator.m
//  Untitled
//
//  Created by Alex on 07.11.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "mutator.h"

@implementation Cell(mutator)
-(void)mutate:(int)x {
	int i;
	int indexes[N_CHARS];
	
	if (x < 0)
		x = 0;
	if (x > N_CHARS)
		x = N_CHARS;
	
	// init
	for (i = 0; i < N_CHARS; ++i)
		indexes[i] = i;
	// shuffle
	for (i = 0; i < N_CHARS-1; ++i) {
		int j = arc4random() % (N_CHARS - (i+1)) + i + 1;
		int k = indexes[i];
		indexes[i] = indexes[j];
		indexes[j] = k;
	}
	// change
	for (i = 0; i < x; ++i) {
		int index = indexes[i];
		int newCharIndex = arc4random() % N_CHARSET;
		if (chars[newCharIndex] == [self.DNA objectAtIndex:index])
			newCharIndex = (newCharIndex + 1) % N_CHARSET;
		[self.DNA insertObject:chars[newCharIndex] atIndex:index];
	}
}
@end

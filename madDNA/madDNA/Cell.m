//
//  Cell.m
//  madDNA
//
//  Created by Andrey Kolomoets on 02.11.12.
//  Copyright (c) 2012 Andrey Kolomoets. All rights reserved.
//

#import "Cell.h"
#include "stdlib.h"

@implementation Cell {
	const NSArray *chars;
	NSMutableArray *dna;
}

- (id)getRandomChar {
	return [chars objectAtIndex:arc4random() % 4];
}

- (id)init {
	self = [super init];
	if (self) {
		dna = [NSMutableArray arrayWithCapacity:100];
		chars = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
		for (int i = 0; i < 100; i++) {
			[dna insertObject:[self getRandomChar] atIndex:i];
		}
	}
	return self;
}

- (id)charAtPosition:(int)position {
	return [dna objectAtIndex:position];
}

- (int)hammingDistance:(Cell *)cell {
	int result = 0;
	for (int i = 0; i < 100; i++) {
		if ([self charAtPosition:i] != [cell charAtPosition:i]) {
			result++;
		}
	}
	return result;
}

- (void)mutateAtPosition:(int)index {
	NSString *current_char = [self charAtPosition:index];
	NSString *new_char = [self getRandomChar];
	while (current_char == new_char) {
		new_char = [self getRandomChar];
	}
	[dna replaceObjectAtIndex:index withObject:new_char];
}

@end

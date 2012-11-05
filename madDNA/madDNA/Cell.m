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
	NSArray *chars;
	NSMutableArray *dna;
}

- (id)getRandomCharFromArray:(NSArray*)array {
	// массив не будет нулевой длины, в данной реализации )
	return [array objectAtIndex:arc4random() % [array count]];
}

- (id)getRandomChar {
	return [self getRandomCharFromArray:chars];
}

- (id)init {
	self = [super init];
	if (self) {
		chars = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
		dna = [NSMutableArray arrayWithCapacity:100];
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
	// отфильтровать возможные символы для мутации, исключив из них текущий символ
	// промежуточная переменная possible_chars не нужна, но так легче читать
	NSArray *possible_chars = [chars filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF <> %@", [self charAtPosition:index]]];
	// теперь из них - новый символ
	NSString *new_char = [self getRandomCharFromArray:possible_chars];
	[dna replaceObjectAtIndex:index withObject:new_char];
}

@end

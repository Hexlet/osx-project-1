//
//  Cell+Mutator.m
//  HexletProject1
//
//  Created by Dmitry Remesov on 06.11.12.
//  Copyright (c) 2012 Dmitry Remesov. All rights reserved.
//

#import "Cell+Mutator.h"



@implementation Cell (Mutator)

- (void)mutate:(NSUInteger)percentage
{
	NSUInteger dnaLength = [self.dna count];
	NSUInteger symbolsToMutate = round((double)MIN(100, percentage) * (double)dnaLength / 100.0);

	NSLog(@"Mutating %lu symbols from %lu (%lu%%)", symbolsToMutate, dnaLength, percentage);
	
	NSMutableDictionary* indexes = [[NSMutableDictionary alloc] initWithCapacity:dnaLength];
	for (NSUInteger index = 0; index < dnaLength; ++index) {
		[indexes setObject:[NSNumber numberWithInteger:random()]
					forKey:[NSNumber numberWithInteger:index]];
	}

	NSUInteger dnaSymbolsCount = [Cell.dnaSymbols count];
	NSArray *keysSorted = [indexes keysSortedByValueUsingSelector:@selector(compare:)];
	for (NSNumber* index in keysSorted) {
		NSUInteger symbolIndex = [Cell.dnaSymbols indexOfObject:[self.dna objectAtIndex:[index integerValue]]];
		NSUInteger newSymbolIndex = (symbolIndex + random()%(dnaSymbolsCount-1) + 1)%dnaSymbolsCount;

		[self.dna replaceObjectAtIndex:[index integerValue] withObject:[Cell.dnaSymbols objectAtIndex:newSymbolIndex]];

		if (!--symbolsToMutate) break;
	}
}

@end

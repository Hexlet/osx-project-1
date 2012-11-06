//
//  Cell.m
//  HexletProject1
//
//  Created by Dmitry Remesov on 06.11.12.
//  Copyright (c) 2012 Dmitry Remesov. All rights reserved.
//

#import "Cell.h"

#define kDNALength 100

@implementation Cell

@synthesize dna = _dna;

- (NSMutableArray*) dna
{
	if (!_dna)
		_dna = [[NSMutableArray alloc] initWithCapacity:kDNALength];

	return _dna;
}

+ (NSArray*) dnaSymbols
{
	static NSArray* _dnaSymbols = nil;

	if (!_dnaSymbols)
		_dnaSymbols = @[@"A", @"T", @"G", @"C"];

	return _dnaSymbols;
}

- (id)init
{
	if (self = [super init]) {
		for (NSUInteger index = 0; index < kDNALength; ++index) {
			[self.dna addObject:[Cell.dnaSymbols objectAtIndex: random()%[Cell.dnaSymbols count]]];
		}
	}

	return self;
}

- (NSUInteger)hammingDistance:(Cell*)anotherCell
{
	if (anotherCell == self) return 0;

	NSUInteger dnaLength = [self.dna count], distance = 0;

	for (NSUInteger index = 0; index < dnaLength; ++index) {
		if (![[self.dna objectAtIndex:index] isEqual:[anotherCell.dna objectAtIndex:index]])
			++distance;
	}

	return distance;
}

- (NSString*)description
{
	return [self.dna componentsJoinedByString:@""];
}

- (Cell*)copyWithZone:(NSZone*)zone
{
	Cell* newCell = [[Cell allocWithZone:zone] init];
	newCell->_dna = [self.dna mutableCopy];

	return newCell;
}

@end

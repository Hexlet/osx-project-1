//
//  Cell.m
//  Hexlet_DNA
//
//  Created by evgenzh on 10/30/12.
//  Copyright (c) 2012 evgenzh. All rights reserved.
//

#import "Cell.h"

#define DNA_LENGTH 100

@implementation Cell
- (id)init
{
	self = [super init];
	
	if(self)
	{
		_dna = [[NSMutableArray alloc] initWithCapacity:DNA_LENGTH];
		
		chromosome = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
		
		for(int i = 0; i < DNA_LENGTH; i++)
			[_dna addObject:[chromosome objectAtIndex:arc4random()%4]];
	}
	
	return self;
}

- (int)hammingDistance:(Cell*)cell
{
	int count = 0;
	
	for(int i = 0; i < [self.dna count]; i++)
	{
		NSString *chromosome1 = [self.dna objectAtIndex:i];
		NSString *chromosome2 = [cell.dna objectAtIndex:i];
		
		if(![chromosome1 isEqualToString:chromosome2])
			count++;
	}
	
	return count;
}

@end

@implementation Cell (mutator)

- (void)mutate:(int)percent
{
	if(percent > 100) // if > 100%
		return;
	
	int x = percent * DNA_LENGTH / 100;
	
	NSMutableArray *mutatedChromosomeIndexes = [NSMutableArray arrayWithCapacity:x];
	
	while ([mutatedChromosomeIndexes count] < x)
	{
		NSNumber *rand_position = [NSNumber numberWithInt:arc4random()%DNA_LENGTH];
		
		if(![mutatedChromosomeIndexes containsObject:rand_position])
			[mutatedChromosomeIndexes addObject:rand_position];
	}
	
	for(NSNumber *index in mutatedChromosomeIndexes)
		[self.dna replaceObjectAtIndex:[index intValue] withObject:[chromosome objectAtIndex:arc4random()%4]];
}

@end

@implementation Cell (dna_showing)

- (NSString*)getDNA
{
	NSMutableString *dnaString = [[NSMutableString alloc] initWithCapacity:DNA_LENGTH];
	
	for(NSString *item in _dna)
		[dnaString appendString:item];
	
	return dnaString;
}

@end
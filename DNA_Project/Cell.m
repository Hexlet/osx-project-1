//
//  Cell.m
//  Hexlet_DNA
//
//  Created by evgenzh on 10/30/12.
//  Copyright (c) 2012 evgenzh. All rights reserved.
//

#import "Cell.h"

#define DNA_LENGTH 100000

#define FAST_MUTATION 1 // set to 1 for using fast mutate: method

@implementation Cell
- (id)init
{
	self = [super init];
	
	if(self)
	{
		_dna = [[NSMutableArray alloc] initWithCapacity:DNA_LENGTH];
		
		chromosome = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
		
		for(int i = 0; i < DNA_LENGTH; i++)
			[_dna addObject:[chromosome objectAtIndex:arc4random()%4]];
	}
	
	return self;
}

- (int)hammingDistance:(Cell*)cell
{
    __block int count = 0;
	
    [self.dna enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         if(![obj isEqual:[cell.dna objectAtIndex:idx]])
             count++;
     }];

	return count;
}

@end

@implementation Cell (mutator)

- (void)mutate:(int)percent
{
	if(percent > 100) // if > 100%
		return;
	
	int x = percent * DNA_LENGTH / 100;

#if FAST_MUTATION
    
	NSMutableIndexSet *mutatedChromosomeIndexes = [[NSMutableIndexSet alloc] init];
	
	while ([mutatedChromosomeIndexes count] < x)
	{
		NSUInteger rand_position = arc4random()%DNA_LENGTH;
        [mutatedChromosomeIndexes addIndex:rand_position];
	}
    
    [mutatedChromosomeIndexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop)
    {
        NSMutableArray *temp = [chromosome mutableCopy];
        [temp removeObject:[self.dna objectAtIndex:idx]];
        
        [self.dna replaceObjectAtIndex:idx withObject:[temp objectAtIndex:arc4random()%3]];
    }];
    
#else
	
	NSMutableArray *mutatedChromosomeIndexes = [NSMutableArray arrayWithCapacity:x];
	
	while ([mutatedChromosomeIndexes count] < x)
	{
		NSNumber *rand_position = [NSNumber numberWithInt:arc4random()%DNA_LENGTH];
		
		if(![mutatedChromosomeIndexes containsObject:rand_position])
			[mutatedChromosomeIndexes addObject:rand_position];
	}
	
	for(NSNumber *index in mutatedChromosomeIndexes)
	{
		@autoreleasepool
		{
			NSMutableArray *temp = [chromosome mutableCopy];
			[temp removeObject:[self.dna objectAtIndex:[index intValue]]];
			
			[self.dna replaceObjectAtIndex:[index intValue] withObject:[temp objectAtIndex:arc4random()%3]];
		}
	}
    
#endif

}

@end

@implementation Cell (dna_showing)

- (NSString*)getDNA
{
	NSMutableString *dnaString = [[NSMutableString alloc] initWithCapacity:DNA_LENGTH];
	
	[_dna enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
    {
        [dnaString appendString:obj];
    }];
	
	return dnaString;
}

@end
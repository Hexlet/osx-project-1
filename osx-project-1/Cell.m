//
//  Cell.m
//  osx-project-1
//
//  Created by Serge Kristal on 31.10.12.
//  Copyright (c) 2012 Salakhutdinov Shaukat. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init
{
	if ( (self = [super init]) )
	{
		gen = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
		
		[self fillDna];
	}
	
	return self;
}

- (int)genIndex2:(int)genIndex1
{
	//аденин (A) соединяется только с тимином (T)
	//гуанин (G) соединяется только с цитозином (C)
	
	if ( genIndex1 < 2 ) {
		return ( genIndex1 == 0 ) ? 1 : 0;
	} else {
		return ( genIndex1 == 2 ) ? 3 : 2;
	}
	
	return arc4random() % 4; //<< на всякий пожарный
}

- (void)fillDna
{
	dna = [[NSMutableArray alloc] init];
	
	for (int i=1; i<=100; i+=2) {
		int index1 = arc4random() % 4;
		int index2 = [self genIndex2:index1];
		
		[dna addObject:[gen objectAtIndex:index1]];
		[dna addObject:[gen objectAtIndex:index2]];
	}
}

- (NSString *)gen:(int)index
{
	if ( index > 0 && index < 100 )
		return (NSString *)[dna objectAtIndex:index];

	return @"";
}

- (int)count
{
	return (int)[dna count];
}

- (int)hammingDistance:(Cell *)cell2
{
	int result = 0;
	NSMutableString *s1 = [[NSMutableString alloc] init];
	NSMutableString *s2 = [[NSMutableString alloc] init];
	
	for (int i=0; i<100; ++i) {
		if ( ![ [self gen:i] isEqualToString:[cell2 gen:i] ] ) {
			++result;
			
			[s1 appendString:[self gen:i]]; //<< различающиеся гены в большими буквами
			[s2 appendString:[cell2 gen:i]];
		} else {
			[s1 appendString:[[self gen:i] lowercaseString]];
			[s2 appendString:[[cell2 gen:i] lowercaseString]];
		}
	}
	
	NSLog(@"DNA1: %@", s1);
	NSLog(@"DNA2: %@", s2);

	return result;
}

- (void)print
{
	NSMutableString *s = [[NSMutableString alloc] init];
	for (int i=0; i<100; ++i) {
		[s appendString:[dna objectAtIndex:i]];
	}
	NSLog(@"DNA: %@", s);
}


@end

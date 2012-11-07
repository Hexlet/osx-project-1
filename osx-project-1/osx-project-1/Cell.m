//
//  Cell.m
//  osx-project-1
//
//  Created by MikSer on 05.11.12.
//  Copyright (c) 2012 MikSer. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init
{
	if ( (self = [super init]) )
	{
		fill = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
		[self fillDna];
	}
	
	return self;
}

- (int)dInd2:(int)dInd1
{

	
	if ( dInd1 < 2 ) {
		return ( dInd1 == 0 ) ? 1 : 0;
	} else {
		return ( dInd1 == 2 ) ? 3 : 2;
	}
}

- (void)fillDna
{
	dna = [[NSMutableArray alloc] initWithCapacity:X];
	
	for (int i=0; i<X; i+=2) {
		int index1 = arc4random() % 4;
		int index2 = [self dInd2:index1];
		
		[dna addObject:[fill objectAtIndex:index1]];
		[dna addObject:[fill objectAtIndex:index2]];
	}
}

- (NSString *)result:(int)index
{
	if ( index >= 0 && index < X )
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
	NSMutableString *m1 = [[NSMutableString alloc] initWithCapacity:X];
	NSMutableString *m2 = [[NSMutableString alloc] initWithCapacity:X];
	
	for (int i=0; i<X; ++i) {
		NSString *n1 = [self result:i];
		NSString *n2 = [cell2 result:i];
		if ( ![n1 isEqualToString:n2] ) {
			++result;
			
			[m1 appendString:n1];
			[m2 appendString:n2];
		} else {
			[m1 appendString:[n1 lowercaseString]];
			[m2 appendString:[n2 lowercaseString]];
		}
	}
    
	NSLog(@"DNA1: %@", m1);
	NSLog(@"DNA2: %@", m2);
    
	return result;
}

- (void)print
{
	NSLog(@"DNA: %@", [dna componentsJoinedByString:@""]);
}

- (NSString *)description
{
	return [dna componentsJoinedByString:@""];
}


@end

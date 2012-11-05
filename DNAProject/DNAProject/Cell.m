//
//  Cell.m
//  DNAProject
//
//  Created by cso on 03.11.2012.
//
//

#import "Cell.h"
#import "stdlib.h"

#define CELL_DNA_COUNT 100

@implementation Cell

- (id) initWithDefaultCodes
{
	self = [super init];
	cellCodes = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
	
	if (!self)
		return nil;
	
	DNA = [[NSMutableArray alloc] init];
		
	for (int i = 0; i < CELL_DNA_COUNT; ++i)
		[DNA addObject: [self getRandomCellCode]];
	
	return self;
}

- (void) print
{
	for (int i = 0; i < [DNA count]; ++i)
	{
		NSString* sDna = [DNA objectAtIndex: i];
		NSLog(@"Item with index %i = %@ ", i, sDna);
	}
}

- (int) hammingDistance:(Cell *)cell
{
	int nResult = 0;
	
	for (int i = 0; i != [[cell getDNA] count]; ++i)
	{
		if ( [DNA objectAtIndex: i] != [[cell getDNA] objectAtIndex:i] )
			nResult +=1;
	}
	
	return nResult;
}

- (NSMutableArray*) getDNA
{
	return DNA;
}

- (NSString *)getRandomCellCode
{
	unsigned int nRadomNumber = 0;

	nRadomNumber = arc4random() % 3;
	
	return [cellCodes objectAtIndex:nRadomNumber];
}

@end

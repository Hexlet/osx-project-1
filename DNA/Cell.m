//
// Created by fljot on 11/6/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Cell.h"


@implementation Cell

static int const DNA_SIZE = 100;

- (id)init
{
	self = [super init];
	if (self)
	{
		_DNA = [[NSMutableArray alloc] initWithCapacity:DNA_SIZE];
		for (int i = 0; i < DNA_SIZE; i++)
		{
			[_DNA addObject:[Cell randomDNASymbol]];
		}
	}

	return self;
}


- (NSString *)description
{
	return [NSString stringWithFormat:@"[Cell DNA:%@]", [self.DNA componentsJoinedByString:@""]];
}


+ (NSString *)randomDNASymbol
{
	// Save some memory by using same NSString instances
	static NSArray *symbols = nil;
	if (!symbols)
	{
		symbols = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
	}

	int randomIndex = arc4random() % symbols.count;

	return [symbols objectAtIndex:randomIndex];
}


- (int)hammingDistance:(Cell *)cell
{
	int d = 0;
	for (int i = 0; i < DNA_SIZE; i++)
	{
		if (![((NSString *) self.DNA[i]) isEqualToString:((NSString *)cell.DNA[i])])
		{
			d++;
		}
	}

	return d;
}


@end
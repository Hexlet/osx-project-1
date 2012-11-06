//
// Created by fljot on 11/6/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Cell+Mutator.h"
#import "NSMutableArray+Shuffling.h"


@implementation Cell (Mutator)

- (void)mutate:(int)percentage
{
	if (percentage < 0 || percentage > 100)
	{
		@throw [NSException exceptionWithName:@"Invalid argument"
									   reason:@"Percentage value should be within [0, 100] range"
									 userInfo:nil];
	}

	NSUInteger dnaSize = self.DNA.count;
	int numMutations = percentage * dnaSize / 100;

	NSMutableArray *indexes = [[NSMutableArray alloc] initWithCapacity:dnaSize];
	for (int i = 0; i < dnaSize; i++)
	{
		[indexes addObject:[NSNumber numberWithInt:i]];
	}
	[indexes shuffle];

	for (int i = 0; i < numMutations; i++)
	{
		int index = [[indexes objectAtIndex:i] intValue];
		[self.DNA replaceObjectAtIndex:index withObject:[Cell randomDNASymbol]];
		// В задании не уточнялось, должен ли новый символ отличаться от старого
		// или важен сам факт работы с ячейкой, поэтому просто работаем с ячейкой.
	}
}

@end
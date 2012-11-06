//
// Created by fljot on 11/6/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSMutableArray+Shuffling.h"


@implementation NSMutableArray (Shuffling)

- (void)shuffle
{
	NSUInteger count = [self count];
	for (int i = 0; i < count; ++i)
	{
		NSInteger nElements = count - i;
		NSInteger n = arc4random_uniform(nElements) + i;
		[self exchangeObjectAtIndex:i withObjectAtIndex:n];
	}
}

@end
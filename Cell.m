#import <Foundation/Foundation.h>

#import "Cell.h"

const NSString *dna[] = {@"A", @"T", @"G", @"C"};

@interface Cell(mutator)
- (void)mutate:(int)X;
@end

@implementation Cell(mutator)
- (void)mutate:(int)X
{
	// we know have 100 objects and they are 100%. 1% ~ 1 object. 
	for (int i = 0; i < X; ++i)
	{
		/* code */
		int index1 = arc4random()%sizeof(dna/(sizeof(NSString*)));
		id temp = [self.DNA objectAtIndex:index1];
		int index2 = arc4random()%sizeof(dna/(sizeof(NSString*)));
		[self.DNA insertObject:[self.DNA objectAtIndex:index2] atIndex:index1];
		[self.DNA insertObject:temp atIndex:index2];
	}
}
@end

@implementation Cell
@syntesize DNA = _DNA;
- (id)init
{
	self = [super init];
	if (self)
	{
		self.DNA = [[NSMutableArray alloc] init];
		for (int i = 0; i < 100; i++)
		{
			[self.DNA addObject:[NSNull null]];
		}

		for (id object in self.DNA)
		{
			object = dna[arc4random()%sizeof(dna/(sizeof(NSString*)))];
		}
	}
}

- (int)hammingDistance:(Cell *)otherCell
{
	int countApperance = 0;
	for (int i = 0; i<otherCell.DNA.count; i++)
	{
		if (![[self.DNA objectAtIndex:i] isEqual:[otherCell.DNA objectAtIndex:i]])
			++countApperance;
	}
	return countApperance;
}
@end


#import "Cell.h"

NSString * const dna[] = {@"A", @"T", @"G", @"C"};


@implementation Cell(mutator)
- (void)mutate:(int)percents
{
	// we know have 100 objects and they are 100%. 1% ~ 1 object.

  int iterateTimes = self.DNA.count*percents/100;

  int index1 = 0;
  int index2 = 0;

	NSMutableArray *mutatedIndexs = [[NSMutableArray alloc] init]; // store mutated indexes here

	for (int i = 0; i < iterateTimes; i++)
	{
    do
    {
      index1 = arc4random()%self.DNA.count; // generate first index
      index2 = arc4random()%self.DNA.count; // generate second index

      // if mutatedIndexes is empty add into array generated indexes
      if (mutatedIndexs.count == 0)
      {
        break;
      }
  	}
		while (![mutatedIndexs containsObject:[NSNumber numberWithInt:index1]] && ![mutatedIndexs containsObject:[NSNumber numberWithInt:index2]]);

    [mutatedIndexs addObject:[NSNumber numberWithInt:index1]];
    [mutatedIndexs addObject:[NSNumber numberWithInt:index2]];
  
    [self.DNA exchangeObjectAtIndex:index1 withObjectAtIndex:index2];
	}
}
@end

@implementation Cell
@synthesize DNA = _DNA;
- (id)init
{
	self = [super init];
	if (self)
	{
		self.DNA = [[NSMutableArray alloc] init];
		for (int i = 0; i < 100; i++)
		{
			[self.DNA addObject:dna[arc4random()%sizeof(dna)/sizeof(NSString*)]];
		}
	}
  return self;
}

- (int)hammingDistance:(Cell *)otherCell
{
	int countApperance = 0;
  NSLog(@"otherCell.DNA.count:%lu", otherCell.DNA.count);
	for (int i = 0; i<otherCell.DNA.count; i++)
	{
		if (![[self.DNA objectAtIndex:i] isEqual:[otherCell.DNA objectAtIndex:i]])
			++countApperance;
	}
	return countApperance;
}
@end
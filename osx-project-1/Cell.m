

#import "Cell.h"

NSString * const dna[] = {@"A", @"T", @"G", @"C"};


@implementation Cell(mutator)
- (void)mutate:(int)percents
{
	// we know have 100 objects and they are 100%. 1% ~ 1 object.
  NSMutableSet *set = [[NSMutableSet alloc] init];

  int iterateTimes = self.DNA.count*percents/100;

  int index1 = 0;
  int index2 = 0;

  id temp1 = nil;
  id temp2 = nil;

	for (int i = 0; i < iterateTimes; ++i)
	{
		/* code */
    do
    {
      index1 = arc4random()%(self.DNA.count-1);
      index2 = arc4random()%(self.DNA.count-1);

  		temp1 = [self.DNA objectAtIndex:index1];
      temp2 = [self.DNA objectAtIndex:index2];
      if (set.count == 0)
      {
        [set addObject:temp1];
        [set addObject:temp2];
      }
  	}
		while (![set containsObject:temp1] && ![set containsObject:temp2]);
  
    [set addObject:temp1];
    [set addObject:temp2];

    [self.DNA removeObjectAtIndex:index1];
		[self.DNA insertObject:[self.DNA objectAtIndex:index2] atIndex:index1];

    [self.DNA removeObjectAtIndex:index2];
		[self.DNA insertObject:temp1 atIndex:index2];
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
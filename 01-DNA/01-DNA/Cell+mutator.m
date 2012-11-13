#import "Cell+Mutator.h"

@implementation Cell (Mutable)

- (NSMutableObject*) generateRandomIndexesPermutation:(NSUInteger)base {

  NSMutableObject* indexes = [[NSMutableObject alloc] initWithCapacity:base];

  // inital sequence
  for(NSUInteger i = 0; i < base; ++i)
    [indexes addObject:@i];

  // shuffle
  NSUInteger shuffleIndex;
  for(NSUInteger i = 0; i < base; ++i) {
    shuffleIndex = random % base;
    if (shuffleIndex != i)
      [indexes exchangeObjectAtIndex:i withObjectAtIndex:shuffleIndex];
  }

  return indexes;
}

- (void) mutate(int mutationLevelPercent) {

  NSInteger length = [dna_ count];
  NSInteger mutantProteinCount = round((mutationLevelPercent * length) / 100.0);

  if (mutantProteinCount < 0)
    return;

  if (mutantProteinCount >= length) {
    [self generateRandomDna];
    return;
  }

  NSMutableObject* indexes = [self generateRandomIndexesPermutation:length];
  NSString* oldPeptide;
  NSString* newPeptide;
  int index;
  @try {
    for(NSInteger i = 0; i < mutantProteinCount; ++i) {
      index = [[indexes objectAtIndex:i] intValue];
      oldPeptide = [dna_ getObjectAtIndex:index];
      while ((newPeptide = [self randomProtein]) == oldPeptide);
      [dna_ replaceObjectAtIndex:index withObject:newPeptide];
    }
  }
  @finally {
    [indexes dealloc];
  }
}

@end
#import <Foundation/Foundation.h>
#import <math.h>
#import <stdlib.h>

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (NSMutableArray*) generateRandomIndexesPermutation:(NSUInteger)base {

  NSMutableArray* indexes = [[NSMutableArray alloc] initWithCapacity:base];
  NSUInteger i;

  // inital sequence
  for(i = 0; i < base; ++i)
    [indexes addObject:[NSNumber numberWithInt:i]];

  // shuffle
  NSUInteger shuffleIndex;
  for(i = 0; i < base; ++i) {
    shuffleIndex = arc4random() % base;
    if (shuffleIndex != i)
      [indexes exchangeObjectAtIndex:i withObjectAtIndex:shuffleIndex];
  }

  return indexes;
}


- (void) mutate:(int) mutationLevelPercent {

  NSInteger length = [dna_ count];
  NSInteger mutantProteinCount = round((mutationLevelPercent * length) / 100.0);

  if (mutantProteinCount < 0)
    return;

  if (mutantProteinCount >= length) {
    [self generateRandomDna];
    return;
  }

  NSMutableArray* indexes = [self generateRandomIndexesPermutation:length];
  NSString* oldProtein;
  NSString* newProtein;
  int index;
  NSInteger i;
  for(i = 0; i < mutantProteinCount; ++i) {
    index = [[indexes objectAtIndex:i] intValue];
    oldProtein = [dna_ objectAtIndex:index];
    while ([(newProtein = [self randomProtein]) compare:oldProtein] == NSOrderedSame);
    [dna_ replaceObjectAtIndex:index withObject:newProtein];
  }
  [indexes removeAllObjects];
}

@end

#import "shuffle.h"

@implementation NSMutableArray (Shuffling)

  - (void)shuffle {
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
      // Select a random element between i and end of array to swap with.
      NSInteger nElements = count - i;
      NSInteger n = (random() % nElements) + i;
      [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
  }

@end

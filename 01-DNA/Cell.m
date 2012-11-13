#import "Cell.h"

const MSUInteger kDefDnaLength = 100;
NSString const* kProteins = @"ATGC";

@implementation Cell {
  NSMutableArray* dna_;
}


-(id) init {
  self = [super init];
  if (self) {
    dna_ = [[NSMutableArray alloc] initWithCapacity:kDefDnaLength];
    [self generateRandomDna];
  }
  return self;
}


-(NSString*) randomProtein {
  return [kProteins substringWithRange:NSMakeRange(arc4random() % [kProteins length], 1)];
}


-(void) generateRandomDna {
  [dna_ removeAllObjects];
  for(NSInteger i = 0; i < kDefDnaLength; ++i)
    [dna_ addObject:[self randomProtein]];
}


-(int) hammingDistance:(Cell*) cell {

  int distance = 0;

  NSUInteger sizeA = [dna_ count];
  NSUInteger sizeB = [cell.dna_ count];

  if (sizeB != sizeA) {
    distance = sizeB - sizeA;
    if (sizeA > sizeB) {
      sizeA = sizeB;
      distance = -distance;
    }
  }

  for(NSUInteger i; i < sizeA; ++i)
    if ([dna_ objectAtIndex:i] != [cell.dna_ objectAtIndex:i])
      ++distance;

  return distance;
}

@end
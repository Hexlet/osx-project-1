#import "Cell.h"

const MSUInteger kDefDnaLength = 100;
NSString* const kProteins = {@"A",@"T",@"G",@"C"};

@implementation Cell {
  NSMutableArray* dna_;
}


-(id) init {
  self = [super init];
  if (self) {
    proteins_ = [[NSMutableArray alloc] initWithValues:@"A", @"T", @"G", @"C"];
    dna_ = [[NSMutableArray alloc] initWithCapacity:kDefDnaLength];
    [self generateRandomDna];
  }
  return self;
}


-(NSString*) randomProtein {
  return kProteins_[random % [kProteins_ count]];
}


-(void) generateRandomDna {
  NSInteger size = [dna_ count];
  for(NSInteger i = 0; i < size; ++i)
    [dna_ addObject:[self randomProtein]];
}


-(void)dealloc {
  [dna_ dealloc];
  [super dealloc];
}


-(int) hammingDistance:(Cell*) cell {

  int distance = 0;

  NSUInteger sizeA = [dna_ count];
  NSUInteger sizeB = [cell.dna_ count];

  if (sizeB != sizeA) {
    distance += abs(sizeB - sizeA);
    if (sizeA > sizeB)
      sizeA = sizeB;
  }

  for(NSUInteger i; i < sizeA; ++i)
    if ([dna_ objectAtIndex:i] != [cell.dna_ objectAtIndex:i])
      ++distance;

  return distance;
}

@end
#import "Cell.h"
#import <stdlib.h>

const NSUInteger kDefDnaLength = 100;
NSString const* kProteins = @"ATGC";

@implementation Cell : NSObject

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
  NSInteger i;
  for(i = 0; i < kDefDnaLength; ++i)
    [dna_ addObject:[self randomProtein]];
}


-(int) hammingDistance:(Cell*) cell {

  int distance = 0;

  NSUInteger sizeA = [self->dna_ count];
  NSUInteger sizeB = [cell->dna_ count];

  if (sizeB != sizeA) {
    distance = sizeB - sizeA;
    if (sizeA > sizeB) {
      sizeA = sizeB;
      distance = -distance;
    }
  }

  NSUInteger i;
  for(i = 0; i < sizeA; ++i)
    if ([[dna_ objectAtIndex:i] compare:[cell->dna_ objectAtIndex:i]] !=NSOrderedSame) 
      ++distance;

  return distance;
}

@end

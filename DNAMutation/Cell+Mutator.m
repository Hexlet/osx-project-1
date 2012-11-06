//
//  Cell+Mutator.m
//  DNAMutation
//
//  Created by Gosha Arinich on 10/30/12.
//  Copyright (c) 2012 Gosha Arinich. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void)mutate:(int)degree
{
  int amount = CellLength * degree / 100;
  NSMutableArray *indicesToMutate = [self randomDNAIndices:amount];
  
  int i;
  for (i = 0; i < amount; i++) {
    int idx = [indicesToMutate[i] intValue];

    self.DNA[idx] = [self newElementForIndex:idx];
  }
}

- (NSString *)newElementForIndex:(int)idx
{
  NSString *newElement;
  NSString *oldElement = self.DNA[idx];
  
  while (true) {
    newElement = [[self class] generateRandomElement];
    
    if (![newElement isEqualToString:oldElement])
      break;
  }
  
  return newElement;
}

- (NSMutableArray *)randomDNAIndices:(int)amount
{
  NSMutableArray *randomIndices = [NSMutableArray array];
  
  int i = 0;
  while (i < amount) {
    NSNumber *randomIndex = [NSNumber numberWithInteger:(arc4random() % [self.DNA count])];
    
    if (![randomIndices containsObject:randomIndex]) {
      [randomIndices addObject:randomIndex];
      i++;
    }
  }
  
  return randomIndices;
}

@end

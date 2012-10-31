//
//  Cell.m
//  DNAMutation
//
//  Created by Gosha Arinich on 10/30/12.
//  Copyright (c) 2012 Gosha Arinich. All rights reserved.
//

#import "Cell.h"

@implementation Cell

+ (NSString *)generateRandomElement
{
  NSArray *DNASymbols = @[@"A", @"T", @"G", @"C"];
  NSUInteger randomIndex = arc4random() % [DNASymbols count];
  
  return DNASymbols[randomIndex];
}

- (id)init
{
  if (self = [super init]) {
    _DNA = [NSMutableArray arrayWithCapacity:100];
    [self generateDNA];
  }
  
  return self;
}

- (void)generateDNA
{
  int i;
  for (i = 0; i < 100; i++) {
    _DNA[i] = [self.class generateRandomElement];
  }
}

- (int)hammingDistance:(Cell *)otherCell
{
  __block int distance = 0;
  
  [_DNA enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    if (obj != otherCell.DNA[idx]) distance++;
  }];
  
  return distance;
}

@end

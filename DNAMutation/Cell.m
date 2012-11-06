//
//  Cell.m
//  DNAMutation
//
//  Created by Gosha Arinich on 10/30/12.
//  Copyright (c) 2012 Gosha Arinich. All rights reserved.
//

#import "Cell.h"

int const CellLength = 100;

static NSArray *cellDNASymbols;

@implementation Cell

+ (void)initialize
{
  if (cellDNASymbols == nil)
    cellDNASymbols = @[@"A", @"T", @"G", @"C"];
}

+ (NSString *)generateRandomElement
{
  NSUInteger randomIndex = arc4random() % [cellDNASymbols count];
  
  return cellDNASymbols[randomIndex];
}

- (id)init
{
  if (self = [super init]) {
    _DNA = [NSMutableArray arrayWithCapacity:CellLength];
    [self generateDNA];
  }
  
  return self;
}

- (void)generateDNA
{
  int i;
  for (i = 0; i < CellLength; i++) {
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

- (void)print
{
  NSLog(@"%@", _DNA);
}

@end

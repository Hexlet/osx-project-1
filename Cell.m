//
//  Cell.m
//  DNA
//
//  Created by Olexandr Skrypnyk on 03.01.13.
//  Copyright (c) 2013 Olexandr Skrypnyk. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
  self = [super init];

  [self setValues:[NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil]];
  [self setDNA:[[NSMutableArray alloc] initWithCapacity:100]];

  for (int i = 0; i < 100; i++) {
    [_DNA addObject:[_values objectAtIndex:arc4random() % [_values count]]];
  }

  return self;
}

- (int) hammingDistance: (Cell *) cell {
  int distance = 0;

  for (int i = 0; i < 100; i++) {
    if ([_DNA objectAtIndex:i] != [[cell DNA] objectAtIndex:i]) {
      ++distance;
    }
  }

  return distance;
}

@end
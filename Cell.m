//
//  Cell.m
//  DNA
//
//  Created by Olexandr Skrypnyk on 03.01.13.
//  Copyright (c) 2013 Olexandr Skrypnyk. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
  self = [super init];
  DNA = [[NSMutableArray alloc] initWithCapacity:100];
  values = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];

  for (int i = 0; i < 100; i++) {
    [DNA addObject:[values objectAtIndex:arc4random() % [values count]]];
  }

  return self;
}

-(int) hammingDistance:(Cell *)c {
  int distance = 0;

  for (int i = 0; i < 100; i++) {
    if ([self->DNA objectAtIndex:i] != [c->DNA objectAtIndex:i]) {
      distance += 1;
    }
  }

  return distance;
}

@end

@implementation Cell (mutator)

-(void) mutate:(int)percentage {
  values = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
  
  for (int i = 0; i < percentage; i++) {
    [self->DNA replaceObjectAtIndex:i withObject:[values objectAtIndex:arc4random() % [values count]]];
  }
}

@end
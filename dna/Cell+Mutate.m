//
//  Cell+Mutate.m
//  dna
//
//  Created by Yura Tolstik on 11/2/12.
//  Copyright (c) 2012 Yura Tolstik. All rights reserved.
//

#import <stdlib.h>
#import "Cell+Mutate.h"

#define MIN_PERCENT 0
#define MAX_PERCENT 100

@implementation Cell (Mutator)

-(void) mutate:(int)percent {
  if (percent > MAX_PERCENT || percent < MIN_PERCENT) percent = MIN_PERCENT;
  NSMutableSet *set = [[NSMutableSet alloc] init];
  
  for (int i = 0; i < [[self dna] count] && i * MAX_PERCENT / [[self dna] count] < percent; i++) {
    NSNumber *n = [NSNumber numberWithInt:arc4random()%[[self dna] count]];
    while ([set member:n]) {
      n = [NSNumber numberWithInt:arc4random()%[[self dna] count]];
    }
    [set addObject:n];
    
    NSString *symbol = [self dna][[n integerValue]];
    while ([self dna][[n integerValue]] == symbol) {
      symbol = [Cell randomSymbol];
    };
    [self dna][[n integerValue]] = symbol;
  }
}

@end

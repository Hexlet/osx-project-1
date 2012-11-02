//
//  Cell+Mutate.m
//  dna
//
//  Created by Yura Tolstik on 11/2/12.
//  Copyright (c) 2012 Yura Tolstik. All rights reserved.
//

#import <stdlib.h>
#import "Cell+Mutate.h"

@implementation Cell (Mutator)

-(void) mutate:(int)percent {
  NSMutableSet *set = [[NSMutableSet alloc] init];
  
  for (int i = 0; i < [[self dna] count] && i * 100 / [[self dna] count] < percent; i++) {
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

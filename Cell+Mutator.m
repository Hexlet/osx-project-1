//
//  Cell+Mutator.m
//  DNA
//
//  Created by Olexandr Skrypnyk on 03.01.13.
//  Copyright (c) 2013 Olexandr Skrypnyk. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void) mutate: (int) percentage {
  for (int i = 0; i < percentage; i++) {
    [[self DNA] replaceObjectAtIndex:i withObject:[[self values] objectAtIndex:arc4random() % [[self values] count]]];
  }
}

@end
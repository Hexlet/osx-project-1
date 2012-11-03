//
//  Cell.m
//  DNA
//
//  Created by Meriados on 03.11.12.
//  Copyright (c) 2012 Meriados. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(Cell*) init {
  self = [super init];

  if (self)
  {
    DNA = [[NSMutableArray alloc] init];
    
    for (int arrayN = 0; arrayN < MAX_LEN; arrayN++)
      [DNA addObject:[self getRandomChar]];
  }
  else
    NSLog(@"Невозможно создать объект класса Cell.");
  
  return self;
}

- (void) dealloc {
  [DNA removeAllObjects];
  DNA = nil;
}

- (int) hammingDistanceWithCell:(Cell*) sCell {
  int result = 0;
  for (int nArray = 0; nArray < MAX_LEN; nArray++)
    if ([DNA objectAtIndex:nArray] != [sCell->DNA objectAtIndex:nArray])
      result++;

  return result;
}

- (NSString *) getRandomChar
{
  const NSArray *symbols = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
  // по поводу rand - я знаю, что есть более рандомные способы, но для данной задачи подойдет и этот
  NSString *newChar = [symbols objectAtIndex:rand() % symbols.count];
  symbols = nil;
  return newChar;
}
@end

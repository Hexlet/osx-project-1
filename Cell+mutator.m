//
//  Cell+mutator.m
//  DNA
//
//  Created by Alexander on 05.11.12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void) mutate:(int) toPercent
{
  if ( toPercent > 100 ) toPercent = 100;
  if ( toPercent < 1 ) return;
  
  @autoreleasepool {

    int numberOfItemsToMutate = round( DNA_LENGTH * toPercent / 100);
    int numberOfItemsToSave   = DNA_LENGTH - numberOfItemsToMutate;
    
    NSMutableArray *indices;
    indices = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
  
    for (int i  = 0; i < DNA_LENGTH; i++) {
      NSNumber *curIndex = [[NSNumber alloc] initWithInt:i];
      [indices addObject:curIndex];
    }
    
    //shuffling indices
    for (int i  = 0; i < numberOfItemsToSave; i++) {
      long curIndicesCount = [indices count];
      int randomIndex = arc4random() % (curIndicesCount - 1);
      [indices removeObjectAtIndex: randomIndex];
    }

    //mutating
    for (int i  = 0; i < numberOfItemsToMutate; i++) {
      int curIndex = [[indices objectAtIndex:i] intValue];
      NSString *curDNAPart = [self->DNA objectAtIndex:curIndex];

      NSString *newDNAPart;
      do {
        int rndIndex = arc4random() % 4;
        newDNAPart = [[NSString alloc] initWithString:[DNAparts objectAtIndex:rndIndex]];
      } while (newDNAPart == curDNAPart);
 
      [self->DNA replaceObjectAtIndex:curIndex withObject:newDNAPart];
    }

  }
}

/*
-(NSMutableString *) lastMutationPointers
{
  NSMutableString *result = [[NSMutableString alloc] init];
  for(int i=0; i < DNA_LENGTH; i++) {
    if([self->DNA objectAtIndex:i] == [[toCell getDNA ]objectAtIndex:i])
      [result appendString:@" "];
    else
      [result appendString:@"^"];
  }
  return result;
}
 */

@end

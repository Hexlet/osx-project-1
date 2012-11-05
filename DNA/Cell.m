//
//  Cell.m
//  DNA
//
//  Created by Alexander on 04.11.12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init
{
  self = [super init];
  if (self)
  {
    DNAparts = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
    
    DNA = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
    
    @autoreleasepool {
      
      for (int i  = 0; i < DNA_LENGTH; i++) {
        int rndIndex = arc4random() % 4;
        [DNA addObject:[DNAparts objectAtIndex:rndIndex]];
      }
      
    }
  }
  return self;
}


-(NSMutableArray *) getDNA
{
  return self->DNA;
}


-(void)printOutDna
{
  NSString *result = @"";
  for (NSString *item in self->DNA)
         result = [result stringByAppendingString:item];
  NSLog(@"%@", result);
}


-(int) hammingDistance: (Cell *) toCell
{
  int distance = 0;
  for(int i=0; i < DNA_LENGTH; i++) {
    if([self->DNA objectAtIndex:i] != [[toCell getDNA ]objectAtIndex:i])
      distance++;
  }
  return distance;
}



@end

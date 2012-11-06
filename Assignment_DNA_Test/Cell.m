//
//  Cell.m
//  Assignment_DNA_Test
//
//  Created by Pasha Ortish on 10/31/12.
//  Copyright (c) 2012 Pasha Ortish. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// point number 4 - overriding the original "init" method.

-(id)init
 {
    self = [super init];
    
    if (self)
    {
// points number 4,7 - setup the DNA chaint to 100 symbols and set mutation factor to 33%.        
        self.symbols = @"ATGC";
        self.theDNAchainLength = 100;
        self.theMutationFactor = 33;
        
        self.DNA1 = [[NSMutableArray alloc]init];
        self.DNA2 = [[NSMutableArray alloc]init];
        NSLog(@"================================================================");
        NSLog(@"===================The DNA sequencing BEFORE MUTATION===========");
        for (int count =0 ; count < self.theDNAchainLength; count++)
        {
        [self.DNA1 insertObject:[NSString stringWithFormat:@"%C",[self.symbols characterAtIndex:(arc4random() % (4))]] atIndex:count];
        [self.DNA2 insertObject:[NSString stringWithFormat:@"%C",[self.symbols characterAtIndex:(arc4random() % (4))]] atIndex:count];
         NSLog(@"The RANDOM DNA1 and DNA2 sequencing  %i BEFORE MUTATION is: %@ and %@ ",count+1,[self.DNA1 objectAtIndex:count],[self.DNA2 objectAtIndex:count]);
        }
    }

    return self;
  }

-(int)hammingDistance:(Cell*)c
 {
    self.harmingDistanceCount = 0;
   
    for (int count =0 ; count < self.theDNAchainLength; count++)
    {
      if ([self.DNA2 objectAtIndex:count] != [c.DNA1 objectAtIndex:count])
        {
            self.harmingDistanceCount++;
        }
        
    }
          
     return self.harmingDistanceCount;
 }


@end

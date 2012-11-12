//
//  Cell.h
//  dna
//
//  Created by Алексей on 12.11.12.
//  Copyright (c) 2012 Алексей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSArray.h>

@interface Cell : NSObject
@property NSMutableArray *dna;
@property NSUInteger counter;

-(int) hammingDistance: (Cell*) cell;

@end

@interface Cell (mutator)

-(void) mutate:(int) perc;
@end

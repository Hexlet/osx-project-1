//
//  Cell.h
//  DNA
//
//  Created by Daniel Kurapov on 11/2/12.
//  Copyright (c) 2012 Daniel Kurapov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdlib.h>

#define chain_length 100

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property (readonly) NSArray *dna_nucliotide;

-(int) hammingDistance:(Cell *)x_cell;

@end

//
//  Cell.h
//  Project1-DNA
//
//  Created by Administrator on 31.10.12.
//  Copyright (c) 2012 Mykhailo Oleksiuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Random.h"

@interface Cell : NSObject

@property NSMutableArray* dna;

// Returns array of possible nucleobases: [A, T, G, C]
+ (NSArray *)nucleobases;

// Returns hamming distance between actual and provided cells
- (int)hammingDistance:(Cell *) cell;

@end

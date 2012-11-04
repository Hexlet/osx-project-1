//
//  Cell.h
//  SimpleDNA
//
//  Created by sbogdanov on 03.11.12.
//  Copyright (c) 2012 sbogdanov. All rights reserved.
//

#import <Foundation/Foundation.h>


#define NUCLEOTIDES  @"ACGT"
#define DNA_LENGTH 100


@interface Cell : NSObject

@property NSMutableArray* DNA;
-(int)hammingDistance:(Cell*)compareCell;
@end

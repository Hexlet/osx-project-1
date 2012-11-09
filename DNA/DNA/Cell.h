//
//  Cell.h
//  DNA
//
//  Created by Mac on 11/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Size of DNA array.
 */
static const int DNA_SIZE = 100;

@interface Cell : NSObject

@property (strong) NSMutableArray *DNA;

/**
 * Returns random character from set {A, T, G, C}.
 */ 
+(NSString*) getRandomNucleotide;

/**
 * Calculates hamming distance between self and Cell object from parameter. 
 */
-(int) hammingDistance: (Cell*) cell;

/**
 * Prints DNA on sceen in one string.
 */
-(void) printDNA;

@end

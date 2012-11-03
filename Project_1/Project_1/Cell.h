//
//  Cell.h
//  Project_1
//
//  Created by Arseniy Gushin on 03.11.12.
//  Copyright (c) 2012 Arseniy Gushin. All rights reserved.
//

#import <Foundation/Foundation.h>

// length of DNA chain
#define CHAIN_LENGTH 100

@interface Cell : NSObject
// custom initializer
- (Cell *)init;

// hammingDistance detects number of differences
// between self and given Cell
- (int)hammingDistance:(Cell *)cell;

// returns contents of the genome as one NSString
- (NSString *)stringForGenome;

// returns random number in given bounds
+ (u_int32_t)randomInRangeLo:(u_int32_t)loBound toHi:(u_int32_t)hiBound;
// used to keep my chain of DNA
@property (nonatomic, strong) NSArray *DNA;

// returns one of A, T, G, C symbols randomly
- (NSString *)randomDNASymbol;
@end

//
//  Cell.h
//  DNA
//
//  Created by Sergey Mitskevich on 11/4/12.
//  Copyright (c) 2012 Sergey Mitskevich. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_LENGTH  100
#define NUCLEOTIDES @[@"A", @"T", @"G", @"C"]

@interface Cell : NSObject 

@property NSMutableArray *DNA;

- (void) logDNA;
- (int) hammingDistance: (Cell *) otherCell;
+ (NSString *) getRandomNucleotide;
+ (NSString *) getRandomNucleotideExcept: (NSString *) itemValue;

@end

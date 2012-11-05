//
//  Nucleotide.h
//  dna
//
//  Created by Anton Osenenko on 11/5/12.
//  Copyright (c) 2012 Anton Osenenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum nucleotide {A = 0, T, G, C} NucleotideCode;

@interface Nucleotide : NSObject

@property (readonly) NucleotideCode nucleotideCode;

- (Nucleotide *)initRandom;
- (BOOL)isEqualToNucleotide:(Nucleotide *)nucleotide;

@end

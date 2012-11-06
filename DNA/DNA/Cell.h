//
//  Cell.h
//  DNA
//
//  Created by Alexander Tyaglov on 31.10.12.
//  Copyright (c) 2012 Alexander Tyaglov. All rights reserved.
//

#import <Foundation/Foundation.h>

enum Nucleobase {
    Adenine = 'A',
    Guanine = 'G',
    Thymine = 'T',
    Cytosine = 'C'
};

// Size of DNA array.
extern u_int32_t const DNASize;

@interface Cell : NSObject

@property (readonly) NSMutableArray *DNA;

+ (NSNumber *)randomNucleobase;
+ (NSNumber *)randomNucleobaseWithExcude:(enum Nucleobase) nucleobase;

+ (Cell *)cell;
+ (Cell *)cellWithCell:(Cell *) cell;

- (int)hammingDistance:(Cell *)cell;
- (void)print;

@end
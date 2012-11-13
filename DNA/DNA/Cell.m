//
//  Cell.m
//  DNA
//
//  Created by Mac on 11/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell 

/**
 * Returns random character from set {A, T, G, C}.
 */
+(NSString*) getRandomNucleotide {
    int nextIndex = arc4random_uniform(4);
    switch (nextIndex) {
        case 1:
            return @"T";
            break;
        case 2:
            return @"G";
            break;
        case 3:
            return @"C";
            break;           
        default:
            return @"A";
    }
}

/**
 * Init DNA array with random nucleotides.
 */
-(id) init {
    self = [super init];
    if (self) {
        DNA = [NSMutableArray arrayWithCapacity:DNA_SIZE];
        for (int i = 0; i < DNA_SIZE; i++) {
            [DNA addObject: [Cell getRandomNucleotide]];
        }
    }
    return self;
}

/**
 * Calculates hamming distance between self and Cell object from parameter. 
 */
-(int) hammingDistance: (Cell*) cell {
    int distance = 0;
    for (int i = 0; i < DNA_SIZE; i++) {
        if ([DNA objectAtIndex:i] != [cell nucleotideAtIndex:i]) {
            distance++;
        }
    }
    return distance;
}

/**
 * Returns nucleotides at specified index
 */
-(NSString*) nucleotideAtIndex:(int)index {
    return [DNA objectAtIndex:index];
}

/**
 * Prints DNA on sceen in one string.
 */
-(void) printDNA {
    NSLog(@"%@", [DNA componentsJoinedByString:@""]);
}

@end

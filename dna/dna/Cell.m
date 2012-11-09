//
//  Cell.m
//  dna
//
//  Created by Yuriy Ostapyuk on 11/4/12.
//  Copyright (c) 2012 Yuriy Ostapyuk. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>

@implementation Cell

@synthesize dna;

-(id) init {
    self = [super init];
    
    if (self) {
        dna = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 100; i++) {
            [dna addObject: [Cell getNucliotideFromArray]];
        }
    }
    
    return self;
}

-(int) hammingDistance: newCell {
    int counter = 0;
    for (int i = 0; i <  [dna count]; i++) {
                
        if ([self.dna[i] isNotEqualTo:[newCell dna][i]]) {
            counter++;
        }
    }
    
    return counter;
}

// returns on from four nucliotides
+ (NSString*) getNucliotideFromArray {
    NSString* nucleotides[4] = {@"A", @"T", @"G", @"C"};
    
    return nucleotides[arc4random()%4];
}

@end

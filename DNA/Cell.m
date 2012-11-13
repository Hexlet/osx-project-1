//
//  Cell.m
//  DNA
//
//  Created by Dmytro Chertousov on 12.11.12.
//  Copyright (c) 2012 Dmytro Chertousov. All rights reserved.
//

#import "Cell.h"
#import <stdlib.h>

// Original Cell class

static NSString *const availableGenes = @"ATGC";
static int const dnaLength = 100;


@implementation Cell
-(NSString*)getRandomGene{
    return [availableGenes substringWithRange:NSMakeRange(arc4random()%[availableGenes length], 1)];
}
-(id)init {
    self = [super init];
    if (self){
        int i = 0;
        
        // Creating DNA array
        _DNA = [NSMutableArray arrayWithCapacity:dnaLength];
        
        // Filling DNA array
        for (i=0; i<dnaLength; i++) {
            [_DNA addObject:[self getRandomGene]];
        }        
    }
    return self;
}
-(int)hammingDistance:(Cell *)c{
    int d = 0,
        i = 0;
    
    // Checking values at places
    for (i=0;i<dnaLength;i++){
        if (![([self DNA][i]) isEqualToString:([c DNA][i])]){
            d++;
        }
    }

    return d;
}
@end

// Mutator Cell class
@implementation Cell(mutator)

-(void)mutate:(int)x {
    int i=0,
        mutationLength = 0;

    // Checking input
    assert(x>=0 && x<=100);
    if (x==0) return;

    // Creating array
    NSMutableArray *indexes = [NSMutableArray arrayWithCapacity:dnaLength];

    // Filling array
    for (i=0;i<dnaLength;i++){
        [indexes addObject:[NSNumber numberWithInt:arc4random()%100]];
    }

    // Randomizing array
    for (i = 0; i < dnaLength; i++) {
        [indexes exchangeObjectAtIndex:i withObjectAtIndex:(arc4random()%(dnaLength-i)+i)];
    }

    // Mutating
    mutationLength = (int)roundf((float)dnaLength/100.0f*x);
    for (i=0;i<mutationLength;i++){
        [_DNA replaceObjectAtIndex:[indexes[i] intValue] withObject:[self getRandomGene]];
    }
}

@end
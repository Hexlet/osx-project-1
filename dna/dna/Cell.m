//
//  Cell.m
//  dna
//
//  Created by Vitaly Larchenkov on 11/9/12.
//  Copyright (c) 2012 Vitaly. All rights reserved.
//

#import "Cell.h"

const int dnaSize = 100;
const int numberOfUsedGenes = 4;

@implementation Cell
-(id) init {
    self = [super init];
    if (self) {
        usedGenes = [[NSMutableArray alloc] initWithObjects:@"A",@"T",@"G",@"C",nil];
        DNA = [[NSMutableArray alloc] initWithCapacity:dnaSize];
        
        for (int i = 0; i < dnaSize; ++i) {
            [DNA setObject:[self getRandomGene] atIndexedSubscript:i];
        }
    }
    return self;
}
-(int)hammingDistance:(Cell *)sample {
    int difference = 0;
    if ([DNA isEqualTo:sample->DNA] == NO) {
        for (int i = 0; i < dnaSize; ++i) {
            if (DNA[i] != sample->DNA[i]) {
                ++difference;
            }
        }
    }
    return difference;
}
-(id)getRandomGene {
    return usedGenes[arc4random_uniform(numberOfUsedGenes)];
}
-(NSMutableArray *)getDna {
    return self->DNA;
}
@end

@implementation Cell (mutator)
-(void)mutate:(int)percentOfMutations{
    BOOL replacePositions[dnaSize];
    int mutatePosition;
    
    int defaultValue = (percentOfMutations < 100) ? NO : YES;
    for (int i = 0; i < dnaSize; ++i) {
        replacePositions[i] = defaultValue;
    }

    if (percentOfMutations < 100) {
        int mutations = 0;
        while (mutations < percentOfMutations) {
            mutatePosition = arc4random_uniform(100);
            if (replacePositions[mutatePosition] == NO) {
                replacePositions[mutatePosition] = YES;
                ++mutations;
            }
        }
    }
    
    for (int i = 0; i < dnaSize; ++i) {
        if (replacePositions[i]) {
            [DNA setObject:[self getRandomGene] atIndexedSubscript:i];
        }
    }
}
@end
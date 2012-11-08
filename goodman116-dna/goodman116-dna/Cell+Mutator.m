//
//  Cell+Mutator.m
//  goodman116-dna
//
//  Created by goodman116 on 11/6/12.
//  Copyright (c) 2012 goodman116. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate:(int)percentageOfMutation {
    if ((percentageOfMutation <= 0) || (percentageOfMutation > 100)) {
        [NSException raise:@"Invalid percentage value" format:@"percentage of %i is invalid", percentageOfMutation];
    } else {
        NSMutableArray *arrayOfIndices = [NSMutableArray arrayWithCapacity:size];
        for (int i = 0; i < size; i++) {
            [arrayOfIndices addObject: [NSNumber numberWithInt: i]];
        }
        for (int j = 0; j < (int)roundf(size * percentageOfMutation / 100); j++) {
            int linearIndex = arc4random_uniform((int)[arrayOfIndices count]);
            NSNumber *linearElement = [arrayOfIndices objectAtIndex: linearIndex];
            int indexToMutate = [linearElement intValue];
            NSString *nucleotide, *nucleotideMutated;
            nucleotide = [self.dna objectAtIndex:indexToMutate];
            nucleotideMutated = self.getRandomNucleotide;
            while ([nucleotideMutated isEqualToString: nucleotide]) {
                nucleotideMutated = self.getRandomNucleotide;
            }
            [self.dna setObject:nucleotideMutated atIndexedSubscript:indexToMutate];
            [arrayOfIndices removeObjectAtIndex:linearIndex];
        }
    }
}

@end

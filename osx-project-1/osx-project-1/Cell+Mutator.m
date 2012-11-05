//
//  Cell+Mutator.m
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import "Cell+Mutator.h"
#import "Random.h"
#import "DNAGenerator.h"

@implementation Cell (Mutator)

- (void) mutate:(int)replacementCount {
    if (replacementCount <= 0) {
        return;
    }
    DNAGenerator *dnaGenerator = [[DNAGenerator alloc] init];
    NSIndexSet *indexes = [Random nextSequenceOfLength:replacementCount withUpperBound:self.dna.count];
    NSUInteger index = indexes.firstIndex;
    while (index != NSNotFound) {
        self.dna[index] = [dnaGenerator randomDNASymbolExcept:self.dna[index]];
        index = [indexes indexGreaterThanIndex:index];
    }
}

@end

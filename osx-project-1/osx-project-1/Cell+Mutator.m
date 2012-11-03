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
    if (replacementCount <= 0) { return; }
    DNAGenerator *dnaGenerator = [[DNAGenerator alloc] init];
    NSOrderedSet *indexes = [Random nextSequenceOfLength:replacementCount withUpperBound:self.dna.count];
    for (NSNumber *index in indexes) {
        int i = index.intValue;
        self.dna[i] = [dnaGenerator randomDNASymbol];
    }
}

@end

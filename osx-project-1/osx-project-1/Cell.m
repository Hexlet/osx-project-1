//
//  Cell.m
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import "Cell.h"
#import "DNAGenerator.h"

@implementation Cell

- (id) init {
    self = [super init];
    if (self) {
        DNAGenerator *dnaGenerator = [[DNAGenerator alloc] init];
        _dna = [dnaGenerator createDNAWithCapacity:kDNACapacity];
    }
    return self;
}

- (int) hammingDistance:(Cell *)cell {
    int hammingDistance = 0;
    for (int index = 0; index < kDNACapacity; index++) {
        if ([self.dna[index] isNotEqualTo:cell.dna[index]]) {
            hammingDistance++;
        }
    }
    return hammingDistance;
}

@end

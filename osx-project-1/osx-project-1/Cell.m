//
//  Cell.m
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import "Cell.h"
#import "DNAGenerator.h"

#define kDNACapacity 100

@implementation Cell

- (id) initWithDNA:(NSMutableArray *)dna {
    self = [super init];
    if (self) {
        _dna = dna;
    }
    return self;
}

- (id) init {
    DNAGenerator *dnaGenerator = [[DNAGenerator alloc] init];
    NSMutableArray *dna = [dnaGenerator createDNAWithCapacity:kDNACapacity];
    return [self initWithDNA:dna];
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

- (id) copyWithZone:(NSZone *)zone {
    NSMutableArray *dnaCopy = [self.dna copyWithZone:zone];
    Cell *copy = [[Cell allocWithZone:zone] initWithDNA:dnaCopy];
    return copy;
}

- (NSString *) description {
    char dnaChars[kDNACapacity];
    for (int i = 0; i < kDNACapacity; i++) {
        NSNumber *symbol = self.dna[i];
        dnaChars[i] = symbol.charValue;
    }
    return [NSString stringWithCString:dnaChars encoding:NSASCIIStringEncoding];
}

@end

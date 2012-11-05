//
//  DNAGenerator.m
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import "DNAGenerator.h"
#import "Random.h"

@implementation DNAGenerator

static NSArray * _allowedSymbols;

+ (NSArray *) allowedSymbols {
    if (!_allowedSymbols) {
        _allowedSymbols = @[@'A', @'T', @'G', @'C'];
    }
    return _allowedSymbols;
}

- (NSMutableArray *) createDNAWithCapacity:(NSUInteger)capacity {
    NSMutableArray *dna = [NSMutableArray arrayWithCapacity:capacity];
    for (int index = 0; index < capacity; index++) {
        dna[index] = [self randomDNASymbol];
    }
    return dna;
}

- (NSNumber *) randomDNASymbolExcept:(NSNumber *)exceptSymbol {
    NSUInteger exceptIndex = [[DNAGenerator allowedSymbols] indexOfObject:exceptSymbol];
    NSUInteger index = [Random nextNumberExcept:exceptIndex withUpperBound:[DNAGenerator allowedSymbols].count];
    return [DNAGenerator allowedSymbols][index];
}

- (NSNumber *) randomDNASymbol {
    NSUInteger index = [Random nextNumber:[DNAGenerator allowedSymbols].count];
    return [DNAGenerator allowedSymbols][index];
}

@end

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
{
    NSArray *allowedSymbols;
}

- (id) init {
    if (self = [super init]) {
        allowedSymbols = @[@'A', @'T', @'G', @'C'];
    }
    return self;
}

- (NSMutableArray *) createDNAWithCapacity:(NSUInteger)capacity {
    NSMutableArray *dna = [NSMutableArray arrayWithCapacity:capacity];
    for (int index = 0; index < capacity; index++) {
        dna[index] = [self randomDNASymbol];
    }
    return dna;
}

- (NSNumber *) randomDNASymbolExcept:(NSNumber *)exceptSymbol {
    NSUInteger exceptIndex = [allowedSymbols indexOfObject:exceptSymbol];
    NSUInteger index = [Random nextNumberExcept:exceptIndex withUpperBound:allowedSymbols.count];
    return allowedSymbols[index];
}

- (NSNumber *) randomDNASymbol {
    NSUInteger index = [Random nextNumber:allowedSymbols.count];
    return allowedSymbols[index];
}

@end

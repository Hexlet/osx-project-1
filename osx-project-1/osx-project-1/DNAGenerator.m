//
//  DNAGenerator.m
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import "DNAGenerator.h"
#import "Random.h"

@interface DNAGenerator()

@property (nonatomic, strong, readonly) NSOrderedSet *allowedSymbols;

@end

@implementation DNAGenerator
{
    NSOrderedSet *_allowedSymbols;
}

- (NSOrderedSet *) allowedSymbols {
    if (!_allowedSymbols) {
        _allowedSymbols = [NSOrderedSet orderedSetWithObjects:@'A', @'T', @'G', @'C', nil];
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

- (NSNumber *) randomDNASymbol {
    return [self randomDNASymbolExcept:nil];
}

- (NSNumber *) randomDNASymbolExcept:(NSNumber *)symbol {
    NSUInteger index = [Random nextNumber:4];
    NSNumber *result = self.allowedSymbols[index];
    if ([result isEqualTo:symbol]) {
        index = (index + 1) % 4;
        result = self.allowedSymbols[index];
    }
    return result;
}

@end

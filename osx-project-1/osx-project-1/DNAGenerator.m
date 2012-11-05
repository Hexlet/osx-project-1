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
    NSUInteger allowedSymbolsCount;
}

- (NSOrderedSet *) allowedSymbols {
    if (!_allowedSymbols) {
        _allowedSymbols = [NSOrderedSet orderedSetWithObjects:@'A', @'T', @'G', @'C', nil];
        allowedSymbolsCount = _allowedSymbols.count;
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
    NSUInteger symbolIndex = [self.allowedSymbols indexOfObject:exceptSymbol];
    if (symbolIndex == NSNotFound) {
        return [self randomDNASymbol];
    }
    NSUInteger index = (symbolIndex + 1 + [Random nextNumber:allowedSymbolsCount-1]) % allowedSymbolsCount;
    return self.allowedSymbols[index];
}

- (NSNumber *) randomDNASymbol {
    NSUInteger index = [Random nextNumber:allowedSymbolsCount];
    return self.allowedSymbols[index];
}

@end

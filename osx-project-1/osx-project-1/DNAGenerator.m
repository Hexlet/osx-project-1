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

- (NSNumber *) randomDNASymbol {
    NSUInteger index = [Random nextNumber:4];
    return self.allowedSymbols[index];
}

- (NSMutableArray *) createDNAWithCapacity:(NSUInteger)capacity {
    NSMutableArray *dna = [NSMutableArray arrayWithCapacity:capacity];
    for (int index = 0; index < capacity; index++) {
        dna[index] = [self randomDNASymbol];
    }
    return dna;
}

@end

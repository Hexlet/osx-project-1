//
//  DNAGeneratorTest.m
//  osx-project-1
//
//  Created by Igor on 04/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import "DNAGeneratorTest.h"
#import "DNAGenerator.h"

@implementation DNAGeneratorTest {
    DNAGenerator *generator;
    NSSet *allowedSymbols;
}

- (void) setUp {
    generator = [[DNAGenerator alloc] init];
    allowedSymbols = [NSSet setWithObjects:@'A', @'T', @'G', @'C', nil];
}

- (void) test_randomDNASymbolReturnsRandomSymbolFromAllowedSymbols {
    NSMutableArray *symbols = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        NSNumber *symbol = [generator randomDNASymbol];
        STAssertTrue([allowedSymbols containsObject:symbol], nil);
        [symbols addObject:symbol];
    }
    for (id allowedSymbol in symbols) {
        STAssertTrue([symbols containsObject:allowedSymbol], nil);
    }
}

- (void) test_randomDNASymbolExceptReturnsRandomSymbolFromAllowedSymbolsThatNotEqualToSpecifiedSymbol {
    NSMutableArray *symbols = [NSMutableArray array];
    for (id exceptSymbol in allowedSymbols) {
        for (int i = 0; i < 25; i++) {
            NSNumber *symbol = [generator randomDNASymbolExcept:exceptSymbol];
            STAssertTrue([allowedSymbols containsObject:symbol], nil);
            STAssertFalse([symbol isEqualTo:exceptSymbol], nil);
            [symbols addObject:symbol];
        }
    }
    for (id allowedSymbol in symbols) {
        STAssertTrue([symbols containsObject:allowedSymbol], nil);
    }
}


- (void) test_createDNAWithCapacityWhenCapacityZeroReturnsEmptyArray {
    NSMutableArray *dna = [generator createDNAWithCapacity:0];
    STAssertEquals((NSUInteger)0, dna.count, nil);
}

- (void) test_createDNAWithCapacityReturnsArrayWithAllowedSymbols {
    NSMutableArray *dna = [generator createDNAWithCapacity:20];
    STAssertEquals((NSUInteger)20, dna.count, nil);
    for (id symbol in dna) {
        STAssertTrue([allowedSymbols containsObject:symbol], nil);
    }
}

@end

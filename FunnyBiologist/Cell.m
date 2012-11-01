//
//  Cell.m
//  FunnyBiologist
//
//  Created by Paul Dmitryev on 30.10.12.
//  Copyright (c) 2012 Paul Dmitryev. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    if (self = [super init]) {
        _DNA = [NSMutableArray arrayWithCapacity: DNA_SIZE];
        
        for (int i=0; i<DNA_SIZE; i++) {
            [_DNA addObject: [Cell getRandomDNA]];
        }
    }
    return self;
}

+(NSString*)getRandomDNA {
    static NSArray* dnaSymbols;
    if (!dnaSymbols) {
        dnaSymbols = @[@"A", @"T", @"G", @"C"];
    }
    NSUInteger randKey = arc4random() % [dnaSymbols count];
    return dnaSymbols[randKey];
}

-(NSUInteger)hammingDistance:(Cell*) other {
    int result = 0;
    for (int i=0; i<DNA_SIZE; i++) {
        if (self.DNA[i]!=other.DNA[i]) {
            result++;
        }
    }
    return result;
}

@end

//
//  Cell.m
//  dna
//
//  Created by Konstantin Tumalevich on 31.10.12.
//  Copyright (c) 2012 Konstantin Tumalevich. All rights reserved.
//

#import "Cell.h"

@implementation Cell


NSString * const Codes[] = {@"A", @"T", @"G", @"C"};

- (id) init {
    self = [super init];
    
    _dna = [[NSMutableArray alloc] init];
    
    for (int i=0; i<100; i++) {
        [_dna insertObject: [self getCode] atIndex:i];
    }
    
    return self;
}

- (int) hammingDistance:(Cell*) another {
    
    int difference = 0;
    
    for(int i=0;i<[_dna count]; i++) {
        if (_dna[i] != another.dna[i]) {
            difference++;
        }
    }
    return difference;
}

- (NSString*) getCode {
    return Codes[arc4random() % 4];
}

- (NSString*) getCode:(NSString *) oldCode {
    NSString* new_code = [self getCode];
    while (new_code == oldCode) {
        new_code = [self getCode];
    }
    return new_code;
}

@end

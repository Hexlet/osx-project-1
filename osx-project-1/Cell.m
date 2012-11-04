//
//  Cell.m
//  osx-project-1
//
//  Created by admin on 03.11.12.
//  Copyright (c) 2012 admin. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    NSUInteger DNALength;
    NSMutableArray* nucleoBases;
}

- (id)init {
    self = [super init];
    if (!self) {
        return self;
    }
    [self initDNALength];
    [self initNucleoBases];
    [self initDNA];
    [self regenerateDna];
    return self;
}

- (int)hammingDistance:(Cell*)anotherCell {
    int distance = 0;
    NSString *myNucleoBase, *anotherNucleoBase;
    for (NSInteger i = 0; i < DNALength; i++) {
        myNucleoBase = [_DNA objectAtIndex:i];
        anotherNucleoBase = [anotherCell.DNA objectAtIndex:i];
        if (![myNucleoBase isEqualToString:anotherNucleoBase]) {
            distance++;
        }
    }
    return distance;
}

- (void)initDNALength {
    DNALength = 100;
}

- (void)initNucleoBases {
    nucleoBases = [NSMutableArray arrayWithObjects:@"A", @"G", @"C", @"T", nil];
}

- (void)initDNA {
    _DNA = [NSMutableArray arrayWithCapacity:DNALength];
}

- (void)regenerateDna {
    for (int i = 0; i < DNALength; i++) {
        [_DNA addObject:[self getRandomNucleoBase]];
    }
}

- (NSString*)getRandomNucleoBase {
    NSInteger randomIndex;
    randomIndex = arc4random() % 4;
    return [nucleoBases objectAtIndex:randomIndex];
}

@end

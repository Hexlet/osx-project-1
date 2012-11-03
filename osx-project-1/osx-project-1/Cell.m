//
//  Cell.m
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import "Cell.h"
#import "Random.h"

#define kDNACapacity 100

@interface Cell()

@property (nonatomic, strong, readonly) NSMutableArray *dna;

@end

@implementation Cell

- (id) init {
    self = [super init];
    if (self) {
        _dna = [Cell createDna];
    }
    return self;
}

+ (NSMutableArray *) createDna {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:kDNACapacity];
    NSArray *chars = [NSArray arrayWithObjects:@'A', @'T', @'G', @'C', nil];
    for (int index = 0; index < kDNACapacity; index++) {
        long randomIndex = [Random nextNumber:4];
        result[index] = chars[randomIndex];
    }
    return result;
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

@end

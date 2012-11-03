//
//  Cell.m
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#define kDNACapacity 100

#import "Cell.h"
#import "Random.h"

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
    NSMutableArray *dna = [NSMutableArray arrayWithCapacity:kDNACapacity];
    NSArray *chars = [NSArray arrayWithObjects:@'A', @'T', @'G', @'C', nil];
    for (int index = 0; index < kDNACapacity; index++) {
        long randomIndex = [Random nextNumber:4];
        dna[index] = chars[randomIndex];
    }
    return dna;
}

@end

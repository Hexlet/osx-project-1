//
//  NKDNASymbol.m
//  MAC101-DNA
//
//  Created by Nikita Korchagin on 31.10.12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import "NKDNASymbol.h"
#include <stdlib.h>

@implementation NKDNASymbol

#pragma mark - Class methods

+ (NKDNASymbol *)DNASymbolWithRandomType
{
    DNASymbolType type = arc4random_uniform(4);
    return [[[NKDNASymbol alloc] initWithType:type] autorelease];
}

#pragma mark - init/dealloc

- (id)initWithType:(DNASymbolType)type
{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

#pragma mark - NSObject

- (NSString *)description
{
    return [NSString stringWithFormat:@"%ld", self.type];
}

#pragma mark - Public methods

- (void)mutate
{
    self.type = arc4random_uniform(4);
}

@end

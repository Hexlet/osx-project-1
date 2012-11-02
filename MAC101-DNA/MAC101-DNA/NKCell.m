//
//  NKCell.m
//  MAC101-DNA
//
//  Created by Nikita Korchagin on 31.10.12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import "NKCell.h"
#import "NKDNASymbol.h"

@implementation NKCell

#pragma mark - init/dealloc

- (id)init
{
    self = [super init];
    if (self) {
        _DNA = [[NSMutableArray arrayWithCapacity:100] retain];
        for (NSUInteger index = 0; index < 100; index++) {
            [_DNA addObject:[NKDNASymbol DNASymbolWithRandomType]];
        }
    }
    return self;
}

- (void)dealloc
{
    [_DNA release];
    [super dealloc];
}

#pragma mark - Public methods

- (NSUInteger)hammingDistance:(NKCell *)cell
{
    if ([self.DNA count] != [cell.DNA count]) {
        NSLog(@"Error: Cells length is not equal");
        return NSNotFound;
    }
    __block NSUInteger hammingDistance = 0;
    [self.DNA enumerateObjectsUsingBlock:^(NKDNASymbol *obj, NSUInteger idx, BOOL *stop) {
        NKDNASymbol *objToCompare = [cell.DNA objectAtIndex:idx];
        if (obj.type != objToCompare.type) {
            hammingDistance++;
        }
    }];
    return hammingDistance;
}

@end

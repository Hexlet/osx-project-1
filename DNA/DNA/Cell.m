//
//  Cell.m
//  DNA
//
//  Created by Foboz on 11.11.12.
//  Copyright (c) 2012 Foboz. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize DNA         = _DNA;

#pragma mark - LifeCycle Section

- (id) init
{
    self = [super init];
    if (self) {
        _DNA = [[NSMutableArray alloc] initWithCapacity:DNA_SIZE];
        NSArray *symbols = [Cell getSymbols];
        int symbolsCount = (int)[symbols count];
        for (NSInteger i = 0; i < DNA_SIZE; ++i) {
            [_DNA addObject:[symbols objectAtIndex:arc4random_uniform(symbolsCount)]];
        }
    }
    return self;
}

- (id) copy
{
    Cell *cellCopy = [[Cell alloc] init];
    cellCopy.DNA = [self.DNA mutableCopy];
    return cellCopy;
}

#pragma mark - Public Section

- (int) hammingDistance:(Cell *)cell
{
    int size = (int)MIN([_DNA count], [cell.DNA count]);
    int hamming = DNA_SIZE - size;
    for (NSInteger i = 0; i < size; ++i) {
        if (![[_DNA objectAtIndex:i] isEqualToString:[cell.DNA objectAtIndex:i]]) {
            ++hamming;
        }
    }
    return hamming;
}

+ (NSArray *) getSymbols
{
    return @[@"A",@"T",@"G",@"C"];
}
@end

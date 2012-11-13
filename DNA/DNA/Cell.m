//
//  Cell.m
//  DNA
//
//  Created by Akki on 11/10/12.
//  Copyright (c) 2012 Akki. All rights reserved.
//

#import "Cell.h"

@implementation Cell
{
    @private
    NSMutableArray *_DNA;
    NSArray *_nucleotides;
}

- (id)init
{
    self = [super init];
    if (self) {
        _nucleotides = @[@"A", @"T", @"G", @"C"];
        _DNA = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i < 100; i++) {
            int index_rand = arc4random() & 3;
            [_DNA addObject:[_nucleotides objectAtIndex:index_rand]];
        }
    }
    return self;
}

- (int)hammingDistance:(Cell *)anotherCell
{
    int result = 0;
    NSArray *dnaToCompare = anotherCell.DNA;
    for (NSString *nucleotide in self.DNA) {
        if (![nucleotide isEqualToString:[dnaToCompare objectAtIndex:[self.DNA indexOfObject:nucleotide]]])
            result += 1;
    }
    return result;
}
@end

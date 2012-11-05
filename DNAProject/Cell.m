//
//  Cell.m
//  DNAProject
//
//  Created by Olga Andreyeva on 11/4/12.
//  Copyright (c) 2012 Olga Andreyeva. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    _DNALength = 4;
    _DNA = [NSMutableArray arrayWithCapacity:_DNALength];
    _symbols = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
    for (int i = 0; i<_DNALength; i++) {
        int randomIndex = arc4random() % _symbols.count;
        [_DNA addObject:_symbols[randomIndex]];
    }
    return self;
}

- (int) hammingDistance:(Cell *)c {
    int distance = 0;
    for (int i = 0; i<self.DNALength; i++) {
        if (self.DNA[i] == c.DNA[i]) {
            distance += 1;
        }
    }
    return distance;
}


@end

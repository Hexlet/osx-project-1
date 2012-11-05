//
//  Cell.m
//  DNA
//
//  Created by Mikhail Filippov on 11/4/12.
//  Copyright (c) 2012 Mikhail Filippov. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>

@implementation Cell
-(id)init {
    self = [super init];
    if (self) {
        _dna = [[NSMutableArray alloc] initWithCapacity:100];
        NSMutableArray *chars = [[NSMutableArray alloc] initWithObjects:@"A", @"T", @"G", @"С", nil];

        for (int i = 0; i < 100; i++) {
            [_dna addObject:[chars objectAtIndex:arc4random() % 4]];
        }
    }
    return self;
}
-(int)hammingDistance:(Cell *)c{
    int result = 0;
    for (int i = 0; i < 100; i++) {
        if ([_dna objectAtIndex:i] == [[c dna] objectAtIndex:i]) {
            result++;
        }
    }
    return result;
}
@end

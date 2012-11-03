//
//  Cell.m
//  DNA
//
//  Created by Makarenko Vitali on 03.11.12.
//  Copyright (c) 2012 Makarenko Vitali. All rights reserved.
//

#import "Cell.h"

@implementation Cell
- (id) init {
    self = [super init];
    if (self) {
        NSMutableArray *tmpArray = [NSMutableArray array];
        for (NSInteger i = 0; i<COUNT; i++) {
            [tmpArray addObject:[DNA_ELEMENTS objectAtIndex:(arc4random() % [DNA_ELEMENTS count])]];
        }
        _DNA = [NSMutableArray arrayWithArray:tmpArray];
    }
    return self;
}
- (int)hammingDistance:(Cell *)otherCell {
    int numberMismatches = 0;
    NSMutableArray *otherDNA = [NSMutableArray arrayWithArray:[otherCell DNA]];
    NSEnumerator *otherEnum = [otherDNA objectEnumerator];
    for (NSString *DNAElement in _DNA) {
        if (DNAElement != [otherEnum nextObject]) {
            numberMismatches++;
        }
    }
    return numberMismatches;
}
@end

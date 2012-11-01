//
//  Cell.m
//  osx-project-1
//
//  Created by Taras Lyapun on 31.10.12.
//  Copyright (c) 2012 Taras Lyapun. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    if (self) {
        [self fillDNA];
    }
    return self;
}

-(id) fillDNA {
    DNA = [NSMutableArray arrayWithCapacity:DNA_CAPACITY];
    for (int i = 0; i < DNA_CAPACITY; i ++) {
        [DNA addObject:[self getRandomSymbol]];
    }
    return DNA;
}

-(id) DNA {
    return DNA;
}

- (NSString*) getRandomSymbol {
    static NSString *symbols[4] = {@"A", @"T", @"G", @"C"};
    return symbols[random()%4];
}

- (int) hammingDistance:(Cell*)aCell  {
    int hammingDistance = 0;
    for (int i = 0; i < DNA_CAPACITY; i++) {
        if ([DNA objectAtIndex:i] != [aCell.DNA objectAtIndex:i]) {
            hammingDistance ++;
        }
    }
    return hammingDistance;
}

@end

//
//  Cell.m
//  osx-project-1
//
//  Created by Pavel Nikitin on 11/1/12.
//  Copyright (c) 2012 Pavel Nikitin. All rights reserved.
//

#import "Cell.h"
#import "DNARange.h"

@implementation Cell

-(id) init{
    self = [super init];
    _DNA = [NSMutableArray array];

    _range = [[DNARange alloc] init];
    
    for (int i=0; i<100; i++) {
        [_DNA addObject: [_range randomElement]];
    }
    
    return self;
}

- (id) initWithDNA:(NSMutableArray *)initDNA {
    self = [super init];
    
    // it is important to init with a copy of initDNA instead of the same object
    NSMutableArray *copyOfDNA = [NSMutableArray arrayWithArray:initDNA];
    [self setDNA:copyOfDNA];
    return self;
}

-(int) hammingDistance:(Cell *)anotherCell{
    int counter = 0;
    for (NSUInteger i=0; i < 100; i++) {
        if ([[self DNA] objectAtIndex: i] != [[anotherCell DNA] objectAtIndex: i])
            counter++;
    }
    return counter;
}

@end

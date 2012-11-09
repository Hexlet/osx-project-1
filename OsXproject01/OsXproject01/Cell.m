//
//  Cell.m
//  OsXproject01
//
//  Created by John Smith on 11/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"


@implementation Cell

@synthesize DNA = _DNA;

- (id)init{
    self = [super init];
    if (self) {
        self.DNA = [NSMutableArray arrayWithCapacity:CELLSIZE];
        for (int i = 0; i < CELLSIZE; i++) {
            [self.DNA addObject: [nucleoBaseArray objectAtIndex: arc4random_uniform([nucleoBaseArray count])]];
        }
    }
    return self;
}

- (int)hammingDistance: (Cell *)inputCell{
    int count = 0;
    for (int i = 0; i < CELLSIZE; i++) {
        if (![[self.DNA objectAtIndex:i] isEqualTo:[inputCell.DNA objectAtIndex:i]]) {
            count++;
        }
    }
    return count;
}

@end

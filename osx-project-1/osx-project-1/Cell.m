//
//  Cell.m
//  osx-project-1
//
//  Created by smoke on 11.11.12.
//  Copyright (c) 2012 smoke. All rights reserved.
//

#import "Cell.h"

@implementation Cell
- (id) init {
    self = [super init];
    if (self) {
        _DNA = [[NSMutableArray alloc] init];
        for (int i = 0; i < DNA_LENGTH; i++) {
            [_DNA addObject:[Cell getRandomDNAElement]];
        }
    }
    return self;
}
- (int) hammingDistance:(Cell *) cell {
    int distance = 0;
    for (int i = 0; i < _DNA.count; i++){

        if ([_DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i]) distance++;
    }
    return distance;
}
+ (id) getRandomDNAElement {
    return [DNA_ELEMENTS objectAtIndex:arc4random() % [DNA_ELEMENTS count]];
}
@end

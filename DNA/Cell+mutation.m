//
//  Cell+mutation.m
//  DNA
//
//  Created by Anton Umnitsyn on 5/11/12.
//  Copyright (c) 2012 Anton Umnitsyn. All rights reserved.
//

#import "Cell+mutation.h"

@implementation Cell (mutation)

- (void)mutate:(int)percent {
    NSMutableArray *storedIndexes = [[NSMutableArray alloc] init];
    for (int i = 0; i < percent; i++) {
        int rndIndex = arc4random()%100;
        if ([storedIndexes containsObject:[NSNumber numberWithInt:rndIndex]]) {
            i--;
        }
        else {
            [storedIndexes addObject:[NSNumber numberWithInt:rndIndex]];
            [dna replaceObjectAtIndex:rndIndex withObject:[proteins objectAtIndex:(0+arc4random()%4)]];
        }
    }
}

@end

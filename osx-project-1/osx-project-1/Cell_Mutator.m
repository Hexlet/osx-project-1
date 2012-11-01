//
//  NSObject+Cell_Mutator_h.m
//  osx-project-1
//
//  Created by Taras Lyapun on 01.11.12.
//  Copyright (c) 2012 Taras Lyapun. All rights reserved.
//

#import "Cell_Mutator.h"

@implementation Cell (Mutator)

-(void) mutate: (int) percent {
    int expectedChanges = DNA_CAPACITY * percent / 100;
    int changesCount = 0;
    int randomInt;
    NSMutableArray *changedPositions = [NSMutableArray arrayWithCapacity:percent];
    NSString *replaceSymbol = nil;
    while (changesCount < expectedChanges) {
        randomInt = random() % DNA_CAPACITY;
        if (![changedPositions containsObject:@(randomInt)]) {
            changesCount ++;
            do {
                replaceSymbol = [self getRandomSymbol];
            } while ([DNA[randomInt] isEqualToString:replaceSymbol]);
            [DNA replaceObjectAtIndex:randomInt withObject:replaceSymbol];
            [changedPositions addObject:@(randomInt)];
        }
    }
}

@end

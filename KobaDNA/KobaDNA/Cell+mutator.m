//
//  Cell+mutator.m
//  KobaDNA
//
//  Created by koba on 05.11.12.
//  Copyright (c) 2012 koba. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
-(void) mutate: (int) value{
    int count = 0;
    NSMutableArray *history = [[NSMutableArray alloc] init];
    double procent = [self.DNA count] / 100 * value;
    while (count < procent) {
        int rnd = arc4random() % [self.DNA count];
        if (![history containsObject:[NSNumber numberWithInt:rnd]]) {
            [self.DNA replaceObjectAtIndex:rnd withObject:[Cell getMutation:[self.DNA objectAtIndex:rnd]]];
            [history addObject:[NSNumber numberWithInt:rnd]];
            count++;
        }
    }
}
@end

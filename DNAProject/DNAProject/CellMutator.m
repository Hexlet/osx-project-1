//
//  CellMutator.m
//  DNAProject
//
//  Created by Alex Nureev on 11/9/12.
//  Copyright (c) 2012 Alex Nureev. All rights reserved.
//

#import "CellMutator.h"

@implementation Cell(Mutator)

-(void) mutate:(int)percent {
    int i = 0;

    if (percent > 100) percent = 100;
    if (percent < 0) percent = 0;
    
    percent = percent * [self.DNA count] / 100;

    NSMutableArray* indices = [NSMutableArray arrayWithCapacity:percent];
    
    NSArray* symbols = [NSArray arrayWithObjects:
                        @"A",
                        @"T",
                        @"G",
                        @"C",
                        nil];
    while (percent > 0) {
        do {
            i = arc4random() % 100;
        } while ([indices containsObject:[NSNumber numberWithInt:i]]);
            
        [self.DNA replaceObjectAtIndex:i withObject:[symbols getRandomObject]];
        [indices addObject:[NSNumber numberWithInt:i]];
        percent--;
    }
}

@end

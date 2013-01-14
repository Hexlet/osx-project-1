//
//  Cell+mutate.m
//  arrayRandoom
//
//  Created by vladimir on 14.01.13.
//  Copyright (c) 2013 Владимир Ковалев. All rights reserved.
//

#import "Cell+mutate.h"
#import "NSMutableArray+Shuffling.h"

@implementation Cell (mutate)

-(void) mutate:(int) percent {
    
    int p = floor(([DNA count] * percent) / 100);
    NSMutableArray * copyDNA = [DNA mutableCopy];
    NSMutableArray * indexes = [[NSMutableArray alloc] initWithCapacity:p];
    NSArray * n = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
    
    for(int i = 0; i < p; i++) {
        [indexes addObject:[NSNumber numberWithInt:i]];
    }
    
    [indexes shuffle];
    
    for(int i = 0; i < p; i++) {
        while([[DNA objectAtIndex:[[indexes objectAtIndex:i] intValue]] isEqual:[copyDNA objectAtIndex:[[indexes objectAtIndex:i] intValue]]]) {
            [DNA replaceObjectAtIndex:[[indexes objectAtIndex:i] intValue] withObject:[n objectAtIndex:arc4random()%4]];
        }
    }
}

@end

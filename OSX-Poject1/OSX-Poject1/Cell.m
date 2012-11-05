//
//  Cell.m
//  OSX-Poject1
//
//  Created by keks keksovich on 05.11.12.
//  Copyright (c) 2012 DoZator Home. All rights reserved.
//

#import "Cell.h"

NSArray const *SYMBOLS = nil;

@implementation Cell

-(id) init {
    
    SYMBOLS = @[@"A", @"T", @"G", @"C"];
    
    self = [super init];
    
    if (self) {
        _dna = [NSMutableArray arrayWithCapacity:100];
        for (int i=0; i<100; i++) {
            [self.dna addObject:[SYMBOLS objectAtIndex:arc4random()%[SYMBOLS count]]];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *) mas {
    
    unsigned int counter = 0;
    
    for (int i=0; i<100; i++) {
        if (![[self.dna objectAtIndex:i] isEqual:[mas.dna objectAtIndex:i]]) {
            counter++;
        }
    }
    return counter;
}

@end

@implementation Cell(mutator)

-(void) mutate:(int)percent {
    
    NSMutableArray *alreadyChanged = [NSMutableArray arrayWithCapacity:percent];
     
    for (int i=0; i<percent; i++) {
        BOOL complete = NO;
        do {
            NSNumber *index = [NSNumber numberWithInt:(arc4random()%99)];
            if (![alreadyChanged containsObject:index]) {
                [self.dna replaceObjectAtIndex:[index intValue] withObject:[SYMBOLS objectAtIndex:arc4random()%[SYMBOLS count]]];
                [alreadyChanged addObject:index];
                complete = YES;
            }
        } while (!complete);
    }
}

@end

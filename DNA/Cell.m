//
//  Cell.m
//  DNA
//
//  Created by Sergey Buravtsov on 11/11/12.
//  Copyright (c) 2012 -. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA;

- (id)init {
    
    if (self = [super init]) {

        dnaBlocksValues = [[NSArray alloc] initWithObjects:
                             [NSNumber numberWithUnsignedChar:'A'],
                             [NSNumber numberWithUnsignedChar:'T'],
                             [NSNumber numberWithUnsignedChar:'G'],
                             [NSNumber numberWithUnsignedChar:'C'], nil];

        DNA = [[NSMutableArray alloc] initWithCapacity:DNA_LENGTH];
        
        for (NSUInteger i = 0; i < DNA_LENGTH; i++ ) {

            NSUInteger dnaBlockIndex =  arc4random_uniform(4);
            [DNA insertObject:[dnaBlocksValues objectAtIndex:dnaBlockIndex] atIndex:i];
        }
    }
    
    return self;
}

- (void)dealloc {
    
    [DNA release];
    [dnaBlocksValues release];
    
    [super dealloc];
}

- (int)hammingDistanceWith:(Cell *)cell {

    int distance = 0;

    for (NSUInteger i = 0; i < DNA_LENGTH; i++) {
        
        if (! [[DNA objectAtIndex:i] isEqualToNumber:[cell.DNA objectAtIndex:i]]) {
                 
                 distance++;
        }
    }
    return distance;
}

@end

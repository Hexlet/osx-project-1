//
//  Cell.m
//  osx-project-1
//
//  Created by Alexey Kulik on 10/31/12.
//  Copyright (c) 2012 Alexey Kulik. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize dna;

- (id) init {
    self = [super init];
    
    if (self) {
        dnaChars = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        dna = [[NSMutableArray alloc] init];
        
        int randomCharPosition = 0;
        for (int i = 0; i < 100; i++) {
            randomCharPosition = arc4random() % 4;
            id dnaChar = [dnaChars objectAtIndex: randomCharPosition];
            
            [dna insertObject:dnaChar atIndex:i];
        }
    }
    return self;
}

- (int) hammingDistance:(Cell *)cell {
    int hammingDistance = 0;
    for (int i = 0; i < [dna count]; i++) {
        if ([dna objectAtIndex:i] != [[cell dna] objectAtIndex:i]) {
            hammingDistance++;
        }
    }
    return hammingDistance;
}

- (void) print {
    NSLog(@"%@", dna);
}

@end

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
        dna = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
        
        for (int i = 0; i < DNA_LENGTH; i++) {
            id dnaChar = [self getRandomDnaChar];
            
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

- (NSString*) getRandomDnaChar {
    int index = [self getRandomNumber:(int)[dnaChars count]];
    return [dnaChars objectAtIndex:index];
}

- (int) getRandomNumber:(int)topBound {
    return (int)(arc4random() % topBound);
}

- (void) print {
    NSLog(@"%@", dna);
}

@end

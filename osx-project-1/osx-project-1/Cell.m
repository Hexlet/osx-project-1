//
//  Cell.m
//  osx-project-1
//
//  Created by Alexey Kulik on 10/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize dna;

- (id) init {
    self = [super init];
    
    if (self) {
        dnaChars = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        dna = [[NSMutableArray alloc] initWithCapacity:100];
        
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

- (void) mutate:(int)percentsToMutate {
    int percents = (int)(([dna count] * percentsToMutate) / 100); // in case if dna is not 100 characters long this will give us correct amount of characters to mutate
    
    NSMutableSet* mutatedCharactersPositions = [NSMutableSet set];
    int randomCharPosition = 0;
    int randomDnaPosition = 0;
    
    while ([mutatedCharactersPositions count] != percents) {
        randomCharPosition = arc4random() % 4;
        randomDnaPosition = (int)(arc4random() % [dna count]);
        NSNumber* randomDnaPositionNumber = [NSNumber numberWithInt:randomDnaPosition]; 
        
        if (![mutatedCharactersPositions containsObject:randomDnaPositionNumber])
        {
            id randomDnaChar = [dnaChars objectAtIndex:randomCharPosition];
            id randomDna = [dna objectAtIndex:randomDnaPosition];
            
            if (randomDnaChar != randomDna) {
                [dna replaceObjectAtIndex:randomDnaPosition withObject:randomDnaChar];
                [mutatedCharactersPositions addObject: [NSNumber numberWithInt:randomDnaPosition]];                
            }
        }        
    }
}

- (void) print {
    NSLog(@"%@", [self dna]);
}

@end

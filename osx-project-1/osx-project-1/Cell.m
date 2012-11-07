//
//  Cell.m
//  osx-project-1
//
//  Created by Ivan Kuzmin on 11/5/12.
//  Copyright (c) 2012 Ivan Kuzmin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init {
    self = [super init];

    if (self) {
        // Define a set of DNA-bases (adenine (A), cytosine (C), guanine (G), thymine (T).
         _nucleobases = [NSArray arrayWithObjects: @"A", @"C", @"T", @"G", nil];
        
        // Create DNA from random sequence of nucleotides
        _DNA = [NSMutableArray array];
        for (int i = LENGTH; i--;) {
            int randIndex = arc4random() % 4;
            [self.DNA addObject: [self.nucleobases objectAtIndex:randIndex]];
        }
    }

    return self;
}

-(int)hammingDistance: (Cell *)cell {
    
    int counter = 0;
    
    for (int i = LENGTH; i--;) {
        if ([self.DNA objectAtIndex: i] != [cell.DNA objectAtIndex: i]) {
            counter++;
        }
    }
    
    return counter;
}


@end

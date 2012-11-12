//
//  Cell.m
//  Project1DNA
//
//  Created by Администратор on 11/8/12.
//  Copyright (c) 2012 ky391. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// init
- (id) init {
    self = [super init];
    
    if (self) {
        NSUInteger randomDNA, i;
        
        // length of DNA - 100 is length defined in task
        iDNAlength = 100;
        
        // DNA elements: A T G C
        aDNAelements = [NSMutableArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        
        // DNA queue
        aDNA = [[NSMutableArray alloc] initWithCapacity:iDNAlength];

        // fill DNA queue with random elements
        for (i = 0; i<iDNAlength; i++) {
            randomDNA = arc4random_uniform( [aDNAelements count] );
            [aDNA insertObject: [aDNAelements objectAtIndex: randomDNA]  atIndex: i ];
        }
    }
    return self;
}

-(int) hammingDistance: (Cell *)otherCell {
    int i, hammingDistanceIndex = 0;
    for (i = 0; i<iDNAlength; i++) {
        // if DNA elements not equal then hamming distance is increased by 1
        if ( ! [[self getDNAatIndex: i] isEqualToString: [otherCell getDNAatIndex: i]] ) {
            hammingDistanceIndex++;
        }
    }
    return hammingDistanceIndex;
}


-(NSString *) getDNAatIndex: (NSUInteger) index {
    return (NSString *)[aDNA objectAtIndex: index];
}

-(void) print {
    NSLog(@"%@", aDNA);
}

@end

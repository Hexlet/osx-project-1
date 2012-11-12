//
//  Cell+mutator.m
//  Project1DNA
//
//  Created by ky391 on 11/9/12.
//  Copyright (c) 2012 ky391. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void) mutate: (int) xPercent {
    
    // array of DNA queue indexes for nonrepeatable indexes replacement
    NSMutableArray *aDNAindexes = [[NSMutableArray alloc] initWithCapacity:iDNAlength];
    
    // array of DNA elements for nonrepeatable elements replacement
    NSMutableArray *aDNAelements2;
    
    // object for aDNAindexes array
    NSNumber *nDNAindex = [[NSNumber alloc] initWithInt:(0)];
    
    // iDNAmutateCount - count of elements which are to be mutate
    NSUInteger randomDNAelement, randomDNAindex, i, iDNAmutateCount = iDNAlength*xPercent/100;
    
    // populate array aDNAindexes with sequential numbers (0,1,2,3,...,99)
    for (i=0; i<iDNAlength; i++) {
        nDNAindex = [NSNumber numberWithUnsignedInteger: i];
        [aDNAindexes addObject: nDNAindex];
    }
    
    // mutate DNA
    for (i=0; i<iDNAmutateCount; i++) {
        // every time fill DNA elements
        aDNAelements2 = [NSMutableArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        
        // generate random number - it will produce index of DNA element which is to be mutate
        randomDNAindex = arc4random_uniform( [aDNAindexes count] );

        // look for current DNA element and remove it from array of available elements for nonrepeatability of replacement
        for (int i2=0; i2<[aDNAelements2 count]; i2++) {
            if ( [[aDNA objectAtIndex: [[aDNAindexes objectAtIndex: randomDNAindex] intValue]] isEqualToString: [aDNAelements2 objectAtIndex: i2]] ) {
                    [aDNAelements2 removeObjectAtIndex: i2];
                break;
            }
        }
        
        // random DNA element for mutating
        randomDNAelement = arc4random_uniform( [aDNAelements2 count] );
        
        // do mutate - replace element at random index with random element different from original
        [aDNA replaceObjectAtIndex: [[aDNAindexes objectAtIndex: randomDNAindex] intValue] withObject: [aDNAelements2 objectAtIndex: randomDNAelement]];
        
        // remove index from array for nonfrequency of indexes
        [aDNAindexes removeObjectAtIndex: randomDNAindex];
    }
};

@end

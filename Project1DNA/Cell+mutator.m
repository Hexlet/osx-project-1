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
    
    NSMutableArray *aDNAindexes = [[NSMutableArray alloc] initWithCapacity:iDNAlength];
    
    NSMutableArray *aDNAelements2;
    
    NSNumber *nDNAindex = [[NSNumber alloc] initWithInt:(0)];
    
    NSUInteger randomDNAelement, randomDNAindex, i, iDNAmutateCount = iDNAlength*xPercent/100;
    
    for (i=0; i<iDNAlength; i++) {
        nDNAindex = [NSNumber numberWithUnsignedInteger: i];
        [aDNAindexes addObject: nDNAindex];
    }
    
    //NSLog(@"%@", aDNAindexes);
    //NSLog(@"%@", aDNA);

    for (i=0; i<iDNAmutateCount; i++) {
        
        aDNAelements2 = [NSMutableArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        for (int i2=0; i2<[aDNAelements2 count]; i2++) {
            if ( [[aDNA objectAtIndex: i] isEqualToString: [aDNAelements2 objectAtIndex: i2]] ) {
                    [aDNAelements2 removeObjectAtIndex: i2];
                break;
            }
        }
        randomDNAindex = arc4random_uniform( [aDNAindexes count] );
        randomDNAelement = arc4random_uniform( [aDNAelements2 count] );
        [aDNA replaceObjectAtIndex: [[aDNAindexes objectAtIndex: randomDNAindex] intValue] withObject: [aDNAelements2 objectAtIndex: randomDNAelement]];
        [aDNAindexes removeObjectAtIndex: randomDNAindex];
    }

    //NSLog(@"%@", aDNAindexes);
    //NSLog(@"%@", aDNA);

}
;

@end

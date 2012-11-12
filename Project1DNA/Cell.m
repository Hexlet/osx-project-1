//
//  Cell.m
//  Project1DNA
//
//  Created by Администратор on 11/8/12.
//  Copyright (c) 2012 ky391. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    
    if (self) {
        NSUInteger randomDNA, i;
        
        iDNAlength = 10;
        
        aDNAelements = [NSMutableArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        
        aDNA = [[NSMutableArray alloc] initWithCapacity:iDNAlength];

        for (i = 0; i<iDNAlength; i++) {
            randomDNA = arc4random_uniform( [aDNAelements count] );
            [aDNA insertObject: [aDNAelements objectAtIndex: randomDNA]  atIndex: i ];
            
        }

    }
    
    return self;
}

-(NSString *) getDNAatIndex: (NSUInteger) index {
    return (NSString *)[aDNA objectAtIndex: index];
}

-(int) hammingDistance: (Cell *)otherCell {
    int i, hammingDistanceIndex = 0;
    for (i = 0; i<iDNAlength; i++) {
        
        if ( [[self getDNAatIndex: i] isEqualToString: [otherCell getDNAatIndex: i]] ) {
            
        }
        else {
            hammingDistanceIndex++;
        }
        
    }

    return hammingDistanceIndex;
}

-(void) print {
    NSLog(@"%@", aDNA);
}

@end

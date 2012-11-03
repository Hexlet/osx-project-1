//
//  Cell.m
//  DNA
//
//  Created by Mihail Onoprienko on 3.11.12.
//  Copyright (c) 2012 Mihail Onoprienko. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>

static int DNAlength = 100;

static NSArray *bases;

@implementation Cell

// Returns random nucleobase
+(NSString*) randomBase {
    if (bases == nil) {
        bases = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
    }
    
    int randomIndex = arc4random() % [bases count];
                                      
    return [bases objectAtIndex: randomIndex];
}

-(id)init {
    self = [super init];
    
    // Init DNA array
    self.DNA = [[NSMutableArray alloc] initWithCapacity:DNAlength];

    // Fill random nucleobases
    for (int i = 0; i < DNAlength; i++) {
        [self.DNA insertObject:[Cell randomBase] atIndex:i];
    }

    return self;
}

-(int)hammingDistance: (Cell*)other {
    int distance = 0;
    
    for (int i = 0; i < DNAlength; i++) {
        if ( [self.DNA objectAtIndex:i] != [other.DNA objectAtIndex:i] ) {
            distance++;
        }
    }
    
    return distance;
}

-(NSString*) DNAasString {
    return [_DNA componentsJoinedByString:@""];
}

@end

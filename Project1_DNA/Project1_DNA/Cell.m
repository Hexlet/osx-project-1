//
//  Cell.m
//  Project1_DNA
//
//  Created by Vladimir Koltunov on 04.11.12.
//  Copyright (c) 2012 XCode 4.2.1. All rights reserved.
//

#import "Cell.h"


@implementation Cell{
    long rnd;
}
int const DNA_CAPACITY = 100;

/**
 * Returns array with all possible DNA elements
 */
+(NSArray *) getDNATemplate{
    return [NSArray arrayWithObjects:@"A", @"G", @"T", @"C", nil];
}

/**
 * Getter for DNA
 */
-(NSMutableArray *) getDNA{
    return DNA;
}

/**
 * Initialize
 */
-(id) init{
    self = [super init];
    // Template array with all possible DNA elements
    NSArray* template = [Cell getDNATemplate];

    if(self){
        // initialize DNA
        DNA = [NSMutableArray arrayWithCapacity:DNA_CAPACITY];
        // Fill DNA with random nucleotides
        for (int i=0; i<DNA_CAPACITY; i++) {
            rnd = arc4random()%4;
            
            [DNA addObject:[template objectAtIndex:rnd]];
        }
    }

    return self;
}

/**
 * Return Humming distance between DNAs of
 * current and entered cells objects
 */
-(int) hammingDistance:(Cell *) cell{
    int result = 0;
    
    // check whether current and target cells has
    // equal-lenght DNAs
    if([DNA count] != [[cell getDNA] count]){
        result = -1;
    }
    else
    {
        for (int i=0; i<[DNA count]; i++) {
            // if corresponding items in DNAs are not equal
            if ([DNA objectAtIndex:i] != [[cell getDNA] objectAtIndex:i]) {
                // increase result counter
                result++;
            }
        }
    }
    return result;
}

/**
 * Print DNA elements to NSLog
 */
-(void) printDNA{
   NSLog(@"%@", DNA);
}

@end

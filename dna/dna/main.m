//
//  main.m
//  dna
//
//  Created by Yuri Kirghisov on 07.11.12.
//  Copyright (c) 2012 Yuri Kirghisov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#include <stdlib.h>

@interface Cell (Mutation)

- (void)mutate:(int)percentage;

@end

@implementation Cell (Mutation)

- (void)mutate:(int)percentage
{
    NSMutableArray *mutatingPlaces = [NSMutableArray arrayWithCapacity:percentage];

    // Generating list of mutating indices (DNA places)
    int i;
    for (i=0; i<percentage/DNA_LENGTH; i++) {
        int r = arc4random_uniform(DNA_LENGTH);
        while ([mutatingPlaces containsObject:[NSNumber numberWithInt:r]])
            r = arc4random_uniform(DNA_LENGTH);
        [mutatingPlaces addObject:[NSNumber numberWithInt:r]];
    }
//    NSLog (@"Will mutate indices: %@", [mutatingPlaces description]);
    
    // Mutating generated places
    for (i=0; i<percentage; i++) {
        int index = [[mutatingPlaces objectAtIndex:i] intValue];
        NSString *place = [self.DNA objectAtIndex:index];
        NSString *newValue = place;
        int r;
        while ([newValue compare:place] == NSOrderedSame) {
            r = arc4random_uniform(4);
            newValue = dnaLetters[r];
        }
        [self.DNA replaceObjectAtIndex:index withObject:newValue];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[[Cell alloc] init] autorelease];
        Cell *cell2 = [[[Cell alloc] init] autorelease];
        
        NSLog (@"Old Hamming Distance: %d", [cell1 hammingDistance:cell2]);

//        NSLog (@"DNA1 Before: %@", [cell1 description]);
        [cell1 mutate:2];
//        NSLog (@"DNA1  After: %@", [cell1 description]);
//        NSLog (@"");
        
//        NSLog (@"DNA2 Before: %@", [cell2 description]);
        [cell2 mutate:2];
//        NSLog (@"DNA2  After: %@", [cell2 description]);

        NSLog (@"New Hamming Distance: %d", [cell1 hammingDistance:cell2]);
}

    return 0;
}


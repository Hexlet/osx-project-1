//
//  Cell+Mutator.m
//  dna-project
//
//  Created by Илья Бельский on 11/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <stdlib.h>
#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void) mutate:(int)percents {
    //NSLog(@"before mutation: %@", [self getDnaAsString]);
    
    int absoluteCountToMutate = percents/100.0 * [dna count];

    // create random set of indexes to mutate
    //
    NSMutableSet *uniqueIndexesToMutate = [[NSMutableSet alloc] init];
    for (int i=0; i<absoluteCountToMutate; i++) {
        NSNumber* randomIndex;
        do {
            randomIndex = [NSNumber numberWithInt:(arc4random() % [dna count])];
        } while ([uniqueIndexesToMutate member:randomIndex]);
        [uniqueIndexesToMutate addObject:randomIndex];
    }
    
    // mutate acids from prepared set
    //
    NSString* acids = [Cell getAcidsSet];
    for(NSNumber* indexToMutate in uniqueIndexesToMutate) {
        int randomIndex = arc4random() % [acids length];
        NSString* acid = [NSString stringWithFormat:@"%c", [acids characterAtIndex:randomIndex]];
        //NSLog(@"mutating '%@' to '%@' at index %i", [dna objectAtIndex:indexToMutate.intValue], acid, indexToMutate.intValue);
        [dna replaceObjectAtIndex:indexToMutate.intValue withObject:acid];
    }
    //NSLog(@"after  mutation: %@", [self getDnaAsString]);
    
}
@end

//
//  Cell+Mutator.m
//  DNA
//
//  Created by Vlad on 03.11.12.
//  Copyright (c) 2012 Vlad. All rights reserved.
//

#import "Cell+Mutator.h"
#import "DNAElements.h"
#define NUMBER_OF_ELEMENTS 100

@implementation Cell (Mutator)

-(void) mutate:(int)mutationPercent
{
    if(mutationPercent > 0) {
        int numberOfChangedElements = (((float)[[self DNA] count]) / 100)   * mutationPercent;
        // Generate indexes of elements which sould be changed
        NSMutableSet *setOfIndexes = [[NSMutableSet alloc] init];
        do {
            int index = arc4random() % NUMBER_OF_ELEMENTS;
            [setOfIndexes addObject:[NSNumber numberWithInt:index]];
        } while ([setOfIndexes count] < numberOfChangedElements);
        
        // Set new generated values by found on the previous step indexes
        for(NSNumber *index in setOfIndexes)
        {
            NSString *oldDNAValue = [[self DNA] objectAtIndex:[index integerValue]];
            NSString *newDNAValue = [[NSString alloc] init];
            
            // Radomly generate a new value of DNA chain,
            // if the new value equals the old value, then repeat and regenerate
            do {
                int rangeOfDNAElements = (C + 1) - A;
                // Generate numbers form 1 to 4
                DNAElements dnaElement = (arc4random() % rangeOfDNAElements) + A;
                
                switch (dnaElement) {
                    case A:
                        newDNAValue = @"A";
                        break;
                    case T:
                        newDNAValue = @"T";
                        break;
                    case G:
                        newDNAValue = @"G";
                        break;
                    case C:
                        newDNAValue = @"C";
                        break;
                    default:
                        newDNAValue = @"A";
                        break;
                }
                
            } while ( oldDNAValue == newDNAValue );
            
            [[self DNA] replaceObjectAtIndex:[index integerValue] withObject:newDNAValue];
        } //for
    } //if 
}

@end

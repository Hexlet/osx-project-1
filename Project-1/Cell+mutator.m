//
//  Cell+mutator.m
//  Project-1
//
//  Created by Roman Nekhoroshev on 05.11.12.
//  Copyright (c) 2012 Roman Nekhoroshev. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void) mutate:(int)mutationPercentage {
    //  Count how much nucleotides we have to change to get right
    //   mutation percentage
    if ((mutationPercentage <= 100) && (mutationPercentage >= 0)) {
        int nucleotidesToChangeCounter = [[self DNA] count] * mutationPercentage / 100;
        
        NSMutableArray *nucleotidesToChange;  //  Array of Nucleotide indexes to change
        nucleotidesToChange = [[NSMutableArray alloc] initWithCapacity: nucleotidesToChangeCounter];
        
        while (nucleotidesToChangeCounter > 0) {
            NSNumber *randomIndex = [NSNumber numberWithInt: arc4random() % [[self DNA] count]];
            //  Check if index is not already in list of Nucleotides to change
            if (![nucleotidesToChange containsObject: randomIndex]) {
                [nucleotidesToChange addObject: randomIndex];
                nucleotidesToChangeCounter--;
            }
        }

        NSString *newNucleotide;
        for (NSNumber *index in nucleotidesToChange) {
            //  Generate new nucleotide that is not equal to previos one
            do {
                newNucleotide = [posibleNucleotides objectAtIndex: arc4random() % [posibleNucleotides count]];
            } while (newNucleotide == [[self DNA] objectAtIndex: [index intValue]]);
            
            [[self DNA] setObject: newNucleotide atIndexedSubscript: [index intValue]];
        }
    }
    else {
        NSLog(@"Wrong mutation percentage. It should be between 0 and 100");
    }

}

@end

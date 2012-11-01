//
//  Cell+Mutator.m
//  osx-project-1
//
//  Created by Alexey Kulik on 11/1/12.
//  Copyright (c) 2012 Alexey Kulik. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void) mutate:(int)percentsToMutate {
    @try {
        if (percentsToMutate < 0) {
            [NSException raise:@"Invalid argument" format:@"percentsToMutate value is negative"];
        }
        
        int percents = (int)(([[self dna] count] * percentsToMutate) / 100); // in case if dna is not 100 characters long this will give us correct amount of characters to mutate
        
        NSMutableSet* mutatedCharactersPositions = [NSMutableSet set]; // set of mutated dna positions - this is needed to be sure that every dna character mutate only once
        
        int randomCharPosition = 0;
        int randomDnaPosition = 0;
        
        // do mutation unless we have required amount of dna characters mutated
        while ([mutatedCharactersPositions count] != percents) {
            randomCharPosition = (int)(arc4random() % [dnaChars count]);
            randomDnaPosition = (int)(arc4random() % [[self dna] count]);
            
            // check if current dna character is mutaded. if it is mutaded then move to next character, if not - mutate it
            if (![mutatedCharactersPositions containsObject:[NSNumber numberWithInt:randomDnaPosition]])
            {
                id randomDnaChar = [dnaChars objectAtIndex:randomCharPosition];
                id randomDna = [[self dna] objectAtIndex:randomDnaPosition];
                
                if (randomDnaChar != randomDna) {
                    [[self dna] replaceObjectAtIndex:randomDnaPosition withObject:randomDnaChar];
                    [mutatedCharactersPositions addObject: [NSNumber numberWithInt:randomDnaPosition]]; // add mutated dna character position to set                
                }
            }        
        }
    }
    @catch (NSException* ex) {
        NSLog(@"An error occured: %@", [ex reason]);
    }

}


@end

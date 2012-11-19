//
//  NSObject+Mutator.m
//  DNA
//
//  Created by Vitaly Dyachkov on 11/4/12.
//  Copyright (c) 2012 Vitaly Dyachkov. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void)mutate:(int)factorPercents
{
    if (factorPercents < 0) {
        NSLog(@"Mutate factor percents cannot be negative");
        return;
    }
    
    if (factorPercents > LENGTH_OF_DNA) {
        NSLog(@"Mutate factor percents must be less or equal that length of the DNA");
        return;
    }
    
    long factor = lround(LENGTH_OF_DNA * 0.01 * factorPercents);
    
    // we need replace entire DNA
    if (factor == LENGTH_OF_DNA) {
        for (int i = 0; i < LENGTH_OF_DNA; i++) {
            char *nucleicAcidBases[4] = {"A", "T", "G", "C"};
            int b = arc4random() % 4;
            [self.DNA replaceObjectAtIndex:i withObject:[NSString stringWithUTF8String:nucleicAcidBases[b]]];
        }
        return;
    }
    
    // usedIndexes[n] means whether index N already used; set all to NO at beginning
    BOOL usedIndexes[LENGTH_OF_DNA];
    for (int i = 0; i < LENGTH_OF_DNA; i++) {
        usedIndexes[i] = NO;
    }
    
    
    for (int i = 0; i < factor; i++) {
        int index;
        
        // Get new random unused index for mutate
        BOOL used = YES;
        while (used) {
            index = arc4random() % 100;
            if (!(used = usedIndexes[index])) {
                usedIndexes[index] = YES;
            }
        }
        
        // Get radnom base
        char *nucleicAcidBases[4] = {"A", "T", "G", "C"};
        int b = arc4random() % 4;
        
        [self.DNA replaceObjectAtIndex:index withObject:[NSString stringWithUTF8String:nucleicAcidBases[b]]];
    }
}

@end

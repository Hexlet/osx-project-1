//
//  Cell+mutator.m
//  DNAProcessor
//
//  Created by Sergey Nebolsin on 10.11.12.
//  Copyright (c) 2012 Sergey Nebolsin. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void) mutate:(int)percents {
    NSMutableSet *positions = [NSMutableSet set];
    
    int countToMutate = ([self.dna count] * percents) / 100.0;
    
    while ([positions count] < countToMutate) {
        [positions addObject:[NSNumber numberWithInt: arc4random_uniform((unsigned int)[self.dna count])]];
    }
    
    for (NSNumber *position in positions) {
        NSString *originalNucleicBase = [self.dna objectAtIndex:[position integerValue]];
        NSString *mutatedNucleicBase = [Cell randomNucleicBase];
        while ([mutatedNucleicBase isEqual:originalNucleicBase]) {
            mutatedNucleicBase = [Cell randomNucleicBase];
        }
        [self.dna replaceObjectAtIndex:[position integerValue] withObject:mutatedNucleicBase];
    }
}

@end

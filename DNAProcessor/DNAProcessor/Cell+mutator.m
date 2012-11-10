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
    
    while ([positions count] < percents) {
        [positions addObject:[NSNumber numberWithInt: arc4random_uniform(100)]];
    }
    
    for (NSNumber *position in positions) {
        NSString *originalNucleicBase = [self.dna objectAtIndex:[position integerValue]];
        NSString *mutatedNucleicBase = [self.nucleicBases objectAtIndex:arc4random_uniform(4)];
        while ([mutatedNucleicBase isEqual:originalNucleicBase]) {
            mutatedNucleicBase = [self.nucleicBases objectAtIndex:arc4random_uniform(4)];
        }
        [self.dna replaceObjectAtIndex:[position integerValue] withObject:mutatedNucleicBase];
    }
}

@end

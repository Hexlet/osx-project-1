//
//  Cell+Mutator.m
//  Project1-DNA
//
//  Created by Administrator on 01.11.12.
//  Copyright (c) 2012 Mykhailo Oleksiuk. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void)mutate:(int)percent {
    if (percent < 0 || percent > 100) {
        @throw [NSException exceptionWithName:@"IllegalArgumentException" reason:[NSString stringWithFormat:@"Invalid percent value: %d", percent] userInfo:nil];
    }
    
    NSInteger currentAmountOfElements = [self.dna count];
    int numberOfElementsToReplace = (int)lroundf(currentAmountOfElements * percent / 100);
    
    NSSet *uniqueIndexes = [Random uniqueRandomIntegersWithSize:numberOfElementsToReplace upperBound:(int)currentAmountOfElements];
 
    for(NSNumber *index in uniqueIndexes) {
        
        NSString *currentValue = [self.dna objectAtIndex:[index intValue]];
        NSString *newValue;
        
        // select a new nucleobase that different to current one
        do {
            newValue = [[Cell nucleobases] objectAtIndex:[Random randomInteger:4]];
        } while ([currentValue isEqualToString:newValue]);
        
        [self.dna replaceObjectAtIndex:[index integerValue] withObject:newValue];
    }
}

@end

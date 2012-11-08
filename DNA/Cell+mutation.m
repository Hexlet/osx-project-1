//
//  Cell+mutation.m
//  DNA
//
//  Created by Anton Umnitsyn on 5/11/12.
//  Copyright (c) 2012 Anton Umnitsyn. All rights reserved.
//

#import "Cell+mutation.h"

@implementation Cell (mutation)

- (void)mutate:(int)percent {
    if (percent > 100 || percent < 0) {
        exit(EXIT_FAILURE);
    }
    int proteinsToReplace = abs(DNA_LENGTH*percent/100);
    
    NSMutableDictionary *usedIndexes = [[NSMutableDictionary alloc] initWithCapacity:proteinsToReplace];

    int replacedProteins = 0;
    while (replacedProteins != proteinsToReplace) {
        int rndIndex = arc4random()%DNA_LENGTH;
        NSNumber *currentIndex = [NSNumber numberWithInt:rndIndex];
        if ([usedIndexes objectForKey:currentIndex]) {
            continue;
        }
        [usedIndexes setObject:[NSNumber numberWithInt:1] forKey:[NSNumber numberWithInt:rndIndex]];
        NSString *protein;
        NSMutableArray *tmpProteins = [[NSMutableArray alloc] initWithArray:proteins];
        while (YES) {
            int rndProteinIndex = arc4random()%[tmpProteins count];
            protein = [tmpProteins objectAtIndex:rndProteinIndex];
            if ([protein isEqualToString:[dna objectAtIndex:rndIndex]]) {
                [tmpProteins removeObjectAtIndex:rndProteinIndex];
                continue;
            }
            break;
        }
        [dna replaceObjectAtIndex:rndIndex withObject:protein];
        replacedProteins++;

    }
}


@end

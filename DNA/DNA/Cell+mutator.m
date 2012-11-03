//
//  Cell+mutator.m
//  DNA
//
//  Created by Andrey Misura on 03.11.12.
//  Copyright (c) 2012 Andrey Misura. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void) mutate: (int) percent {
    if (percent <= 0 || percent > 100) return;
    
    NSUInteger dnaCount = [[self DNA] count];
    NSUInteger dnaItemsCount = [DNAItems count];
    NSUInteger countIndexesForMutate = dnaCount * percent / 100;
    
    // Перемешиваем массив
    for(NSUInteger i = 0; i < dnaCount; i++) {
        NSUInteger randIndex = arc4random() % dnaCount;
        [[self DNA] exchangeObjectAtIndex: i withObjectAtIndex: randIndex ];
    }

    // Заменяем указанный процент значений
    NSString *currentItem;
    NSString *replacementItem;
    while (countIndexesForMutate) {
        currentItem = [[self DNA] objectAtIndex:countIndexesForMutate];
        
        do {
            replacementItem = [DNAItems objectAtIndex: arc4random() % dnaItemsCount];
        } while ([currentItem isEqual:replacementItem] == YES);
        
        [[self DNA] replaceObjectAtIndex:countIndexesForMutate withObject: replacementItem];
        
        countIndexesForMutate--;
    }
}

@end

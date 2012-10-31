//
//  Cell+Mutator.m
//  Project1
//
//  Created by Sergey Atroschenko on 31.10.12.
//  Copyright (c) 2012 ASVUSER. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate: (NSUInteger)persent {
    if( persent > 100 ) {
        @throw [NSException exceptionWithName: @"IllegalArgumentException"
                                       reason: @"persent must be from 0 to 100."
                                     userInfo: nil];
    }
                
    int count = kMaxDNASize * persent / 100; // Количество клеток для мутации.

    // Для хранения ужу измененных индексов.
    NSMutableArray *changedIndexes = [[NSMutableArray alloc] init];

    for (int i=0; i < count; i++) {

        int currentIndex = arc4random() % kMaxDNASize;
        // Если такой индекс уже использовался, то ищем новый индекс.
        while ([changedIndexes containsObject:[NSNumber numberWithInt: currentIndex]]) {
            currentIndex = arc4random() % kMaxDNASize;
        }
    
        [changedIndexes addObject: [NSNumber numberWithInt: currentIndex]];
        
        // Генерируем новое значение.
        char newType = kDNATypes[ arc4random() % kDNATypesLenght ];
        [self.DNA replaceObjectAtIndex: currentIndex withObject: [NSNumber numberWithChar: newType]];    
    }
}

@end

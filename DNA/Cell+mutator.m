//
//  Cell+mutator.m
//  DNA
//
//  Created by Kirill Morozov on 31.10.12.
//  Copyright (c) 2012 Kirill Morozov. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell(mutator)
-(void)mutate: (int) mutatePercent {
    NSAssert(mutatePercent < 100 && mutatePercent > 0, @"invalid percent");
    
    NSMutableArray *mutateIndexArray, *dnaIndexArray;
    mutateIndexArray = [[NSMutableArray alloc] initWithCapacity:mutatePercent];
    dnaIndexArray = [[NSMutableArray alloc] initWithCapacity:DNA_LEN];
    for (NSInteger i = 0; i < DNA_LEN; i++)
        [dnaIndexArray addObject:[NSNumber numberWithInteger:i]];

    while (mutatePercent > 0) {
        // добавляем только уникальные индексы, по которым будем мутировать
        int random_index = arc4random() % [dnaIndexArray count];
        [mutateIndexArray addObject:dnaIndexArray[random_index]];
        [dnaIndexArray removeObjectAtIndex:random_index];
        mutatePercent--;
    }
    
    for (id mIndex in mutateIndexArray) {
        // удаляем текущий нуклеотид из массива для замены,
        // чтобы нуклеотид в позиции был гарантированно заменен на другой
        NSString *currentNuke = [DNA objectAtIndex:[mIndex integerValue]];
        NSString *newNucleotide = currentNuke;
        while ([newNucleotide isEqual: currentNuke]) {
            newNucleotide = NUKE_ARR[arc4random() % NUKE_LEN];
        }
        [DNA replaceObjectAtIndex:[mIndex integerValue] withObject:newNucleotide];
    }
}

@end
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
    NSAssert(mutatePercent <= 100 && mutatePercent >= 0, @"invalid percent");
    if(mutatePercent==0) return;
    // вычисляем примерное кол-во индексов для замены, если кол-во элементов DNA != 100
    int numberIndexesToReplace = round((float)DNA_LEN * mutatePercent / 100);
    NSMutableArray *mutateIndexArray, *dnaIndexArray;
    
    mutateIndexArray = [[NSMutableArray alloc] initWithCapacity:numberIndexesToReplace];
    dnaIndexArray = [[NSMutableArray alloc] initWithCapacity:DNA_LEN];
    for (NSInteger i = 0; i < DNA_LEN; i++)
        [dnaIndexArray addObject:[NSNumber numberWithInteger:i]];

    while (numberIndexesToReplace > 0) {
        // добавляем только уникальные индексы, по которым будем мутировать
        int random_index = arc4random() % [dnaIndexArray count];
        [mutateIndexArray addObject:dnaIndexArray[random_index]];
        [dnaIndexArray removeObjectAtIndex:random_index];
        numberIndexesToReplace--;
    }

    for (NSNumber *indexToMutate in mutateIndexArray) {
        // получаем индекс текущего нуклеотида
        NSUInteger currentIndex = [[Cell nucleotides] indexOfObject:[DNA objectAtIndex:[indexToMutate integerValue]]];
        // заменяем текущий нуклеотид на новый
        [DNA replaceObjectAtIndex:[indexToMutate integerValue] withObject:[Cell getRandomNucleotideWithoutIndex:currentIndex]];
    }
}

@end
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
    // mutatePercent - не может быть больше 100%
    NSAssert(mutatePercent < 100 && mutatePercent > 0, @"invalid percent");
    
    NSMutableArray *mutateIndexArray = [[NSMutableArray alloc] initWithCapacity:mutatePercent];
    NSMutableArray *dnaIndexArray = [[NSMutableArray alloc] initWithCapacity:[self dnkArrayLength]];
    for (NSInteger i = 0; i < [DNA count]; i++)
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
        id currentNuke = [DNA objectAtIndex:[mIndex integerValue]];
        id newNucleotide = currentNuke;
        while ([newNucleotide isEqual: currentNuke]) {
            newNucleotide = self.nucleotides[arc4random() % [self.nucleotides count]];
        }
        [DNA replaceObjectAtIndex:[mIndex integerValue] withObject:newNucleotide];
    }
}

@end
//
//  Cell+Mutator.m
//  DNA2
//
//  Created by Evgeny Pozdnyakov on 04.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell+Mutator.h"

// включение (1) и выключение (0) режима отладки
#define DEBUGMODE 0

@implementation Cell (Mutator)

- (void) mutate:(int)percentOfMutation {
    if (DEBUGMODE) {
        NSLog(@"call [Cell percentOfMutation] with value %d\n", percentOfMutation);
    }
    
    if (percentOfMutation > 100) {
        NSLog(@"\nTHE PERCENT OF MUTATION %d IS NOT ALLOWED\n\n", percentOfMutation);
    } else {
        // на основе переданного процента мутаций и длины цепи
        // получаем кол-во нуклеотидов для замены, округленное до целого
        int numberOfMutation = round(nucleotidesInDna / 100.0 * percentOfMutation);
        if (DEBUGMODE) {
            NSLog(@"nucleotides in DNA %d, percent needed %d, final number %d\n", nucleotidesInDna, percentOfMutation, numberOfMutation);
        }
        
        // инициализируем массив позиций нуклеотидов для замены
        NSMutableArray * mutateIndexes = [NSMutableArray arrayWithCapacity:numberOfMutation];
        
        // создаем массив со всеми возможными позициями
        // и заполняем его натуральными числами
        NSMutableArray * allPositions = [NSMutableArray arrayWithCapacity:nucleotidesInDna];
        int i;
        for (i = 0; i < nucleotidesInDna; i++) {
            [allPositions addObject:[NSNumber numberWithInt:i]];
        }
        
        // случайным образом вытаскиваем из массива allPositions нужное количество позиций
        // и заполняем ими массив mutateIndexes
        int randomPosition;
        for (i = 0; i < numberOfMutation; i++) {
            randomPosition = arc4random() % [allPositions count];
            [mutateIndexes addObject:[allPositions objectAtIndex:randomPosition]];
            [allPositions removeObjectAtIndex:randomPosition];
            if (DEBUGMODE) {
                NSLog(@"random position %d, count of available positions %lu\n", randomPosition, [allPositions count]);
            }
        }
        
        // заменяем нуклеотиды в позициях из полученного массива mutateIndexes
        while ([mutateIndexes count] > 0) {
            [self changeNucleotideAtPosition:[[mutateIndexes lastObject] intValue]];
            [mutateIndexes removeLastObject];
        }
    }
}

- (void) changeNucleotideAtPosition:(int)index {
    // вытаскиваем текущий нуклеотид в позиции index
    NSString * currentNucleotide = [self->DNA objectAtIndex:index];
    
    // создаем массив альтернативных нуклеотидов из трех элементов
    // (исключаем текущий нуклеотид из стандартного набора)
    NSMutableArray * alternativeNucleotides = [NSMutableArray arrayWithCapacity:3];
    int i;
    NSString * alternativeNucleotide;
    for (i = 0; i < 4; i++) {
        alternativeNucleotide = [NSString stringWithFormat:@"%c", nucleotides[i]];
        if (alternativeNucleotide != currentNucleotide) {
            [alternativeNucleotides addObject:alternativeNucleotide];
        }
    }
    
    // из полученного массива вытаскиваем случайным образом
    // альтернативный нуклеотид и заменяем им текущий в нужной позиции
    int randomIndex = arc4random() % 3;
    alternativeNucleotide = [alternativeNucleotides objectAtIndex:randomIndex];
    [self->DNA replaceObjectAtIndex:index withObject:alternativeNucleotide];
    
    if (DEBUGMODE) {
        NSLog(@"nucleotide %@ at position %d replaced with %@\n", currentNucleotide, index, alternativeNucleotide);
    }
}
@end

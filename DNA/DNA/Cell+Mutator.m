//
//  Cell+Mutator.m
//  DNA
//
//  Created by Cyxx on 03.11.12.
//  Copyright (c) 2012 Cyxx. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

// мутирование нуклеотида
-(void)mutateNucleotide: (NSUInteger) nucleotideIndexInDNA {

    // индекс нуклеотида в массиве нуклеотидов
    NSUInteger nucleotideIndex = [[Cell nucleotides] indexOfObjectIdenticalTo: [dna objectAtIndex:nucleotideIndexInDNA]];

    // вычисление индекса для мутированного нуклеотида в массиве нуклеотидов
    nucleotideIndex = (nucleotideIndex + 1 + arc4random()%([Cell nucleotides].count - 1))%[Cell nucleotides].count;

    // замена нуклеотида на мутированный в цепочке ДНК
    [dna replaceObjectAtIndex:nucleotideIndexInDNA withObject:[[Cell nucleotides] objectAtIndex:nucleotideIndex]];
}

// мутирование ДНК
-(void)mutate:(int)percent {

    // проверка диапазона percent
    if (percent < 0 || percent > 100) {
        NSLog(@"%i percent is out of range [0, 100]", percent);
        return;
    }

    // создаём набор индексов и заполняем всеми доступными индексами цепочки ДНК: [0, DNA_COUNT - 1]
    NSMutableOrderedSet *set = [NSMutableOrderedSet orderedSet];
    for (int i = 0; i < DNA_COUNT; i++)
        [set addObject:[NSNumber numberWithInt:i]];

    // пересчёт количества мутаций для заданной длины цепочки ДНК
    int mutationsCount = DNA_COUNT*percent/100;

    // цикл мутаций
    for (int i = 0; i < mutationsCount; i++) {
        NSUInteger mutationSetIndex = (arc4random() % set.count);
        NSUInteger nucleotidIndex = [(NSNumber*)[set objectAtIndex:mutationSetIndex] intValue];
        [self mutateNucleotide:nucleotidIndex];

        // чтобы мутация не повторилась, вычеркиваем использованный индекс из набора индексов
        [set removeObjectAtIndex:mutationSetIndex];
    }
}

@end

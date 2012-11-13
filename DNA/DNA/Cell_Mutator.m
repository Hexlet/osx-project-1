//
//  Cell_Mutator.m
//  DNA
//
//  Created by Anton Platonov on 13.11.12.
//  Copyright (c) 2012 Anton Platonov. All rights reserved.
//

#import <stdlib.h>

#import "Cell_Mutator.h"


@implementation Cell (Mutator)

-(void)mutate:(int)X
{
    // пересчитываем проценты в количество элементов
    int mutate_symbols_count = (CELL_DNA_LENGTH == 100) ? X : X * CELL_DNA_LENGTH / 100;
    
    // заводим массив индексов ДНК
    int dna_indexes[CELL_DNA_LENGTH];
    for( int i=0; i<CELL_DNA_LENGTH; i++) {
        dna_indexes[i] = i; // инициализируем номерами по порядку
    }
    
    for (int i=0; i<mutate_symbols_count; i++) {
        // меняем местами порядковый индекс со случайным из оставшихся
        int j = i + random() % (CELL_DNA_LENGTH - i);
        if (i == j) continue; // если вдруг случайный совпал с порядковым — не заморачиваемся с обменом
        int random_index = dna_indexes[j];
        dna_indexes[j] = dna_indexes[i];
        dna_indexes[i] = random_index;
        
        [[self DNA] replaceObjectAtIndex:random_index withObject:[[self class] randomDNASymbol]];
    }
}

@end

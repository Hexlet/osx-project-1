//
//  Cell+Mutator.m
//  hexlet_dna
//
//  Created by Alexander Shvets on 02.11.12.
//  Copyright (c) 2012 Alexander Shvets. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void) mutate:(int)percent {
    
    //проверка допустимыx значений
    if(percent < 1 || percent > 100) {
        NSLog(@"Error: Percentage should be in the range 1-100.");
        return;
    }
    
    uint indexToReplace, nucleotideIndex, indexValue;
    uint nucleotidesToReplace = (uint)(percent * 0.01 * self.dnaLength);
    
    NSMutableArray *replacedIndexes = [NSMutableArray arrayWithCapacity:nucleotidesToReplace];
    
    //заполняем массив доступными индексами
    for (int i = 0; i < self.dnaLength; i++){
        [replacedIndexes addObject:[NSNumber numberWithUnsignedInt:i]];
    }
    
    while (nucleotidesToReplace) {
        indexToReplace = arc4random() % [replacedIndexes count]; //индекс для замены
        indexValue = [[replacedIndexes objectAtIndex:indexToReplace] unsignedIntValue];
        
        do { //исключаем замену шила на мыло)
            nucleotideIndex = arc4random() % 4;
        } while ([[self.dna objectAtIndex:indexValue] isEqual:[self.nucleotides objectAtIndex:nucleotideIndex]]);
        
        //заменяем нуклеотид по индексу indexToReplace
        [self.dna replaceObjectAtIndex:indexValue withObject:[self.nucleotides objectAtIndex:nucleotideIndex]];
        
        [replacedIndexes removeObjectAtIndex:indexToReplace]; //изымаем этот индекс из списка доступных
        
        nucleotidesToReplace--;
    }
        
}

@end

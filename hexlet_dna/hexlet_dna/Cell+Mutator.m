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
    
    uint indexToReplace, nucleotideIndex;
    uint nucleotidesToReplace = (uint)(percent * 0.01 * self.dnaLength);
    
    NSMutableArray *replacedIndexes = [NSMutableArray arrayWithCapacity:nucleotidesToReplace];

    while (nucleotidesToReplace) {
        
        indexToReplace = arc4random() % self.dnaLength; //индекс для замены
        
        //проверяем не обработали ли мы уже этот индекс
        if([replacedIndexes containsObject:[NSNumber numberWithUnsignedInt:indexToReplace]]) continue;
        
        //если нет, добавляем индекс в массив с отработанными индексами
        [replacedIndexes addObject:[NSNumber numberWithUnsignedInt:indexToReplace]];
        
        do { //исключаем замену шила на мыло)
            nucleotideIndex = arc4random() % 4;
        } while ([[self.dna objectAtIndex:indexToReplace] isEqual:[self.nucleotides objectAtIndex:nucleotideIndex]]);
        
        //заменяем нуклеотид по индексу indexToReplace
        [self.dna replaceObjectAtIndex:indexToReplace withObject:[self.nucleotides objectAtIndex:nucleotideIndex]];
        
        nucleotidesToReplace--;
        
    }
        
}

@end

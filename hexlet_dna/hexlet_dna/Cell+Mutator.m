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
    if(percent > 100) percent = 100;
    
    int replaced = 0;
    NSMutableArray *replacedIndexes = [NSMutableArray arrayWithCapacity:100];
    
    do {
        
        int indexToReplace = arc4random() % 100; //индекс для замены
        
        //проверяем не обработали ли мы уже этот индекс
        if([replacedIndexes containsObject:[NSNumber numberWithInteger:indexToReplace]]) continue;
        
        //если нет, добавляем индекс в массив с отработаными индексами
        [replacedIndexes addObject:[NSNumber numberWithInteger:indexToReplace]];
        
        //заменяем нуклеотид по индексу indexToReplace
        int nucleotideIndex = arc4random() % 4;
        [self.dna replaceObjectAtIndex:indexToReplace withObject:[self.nucleotides objectAtIndex:nucleotideIndex]];
        
        replaced++;
        
    } while (replaced < percent);
    
}

@end

//
//  Cell+Mutator.m
//  osx-project-1
//
//  Created by Victor Mylcin on 09.11.12.
//  Copyright (c) 2012 Victor Mylcin. All rights reserved.
//

#import "Cell+Mutator.h"
#import "NSString+Nucleotides.h"

@implementation Cell (Mutator)

-(void) mutate: (int) X {
    
    if (X>0 && X<=100) {
        // список со всеми номерами ячеек которые надо будет менять
        NSMutableArray *indexAtDNA = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
        for (int i=0; i<DNA_LENGTH; i++) {
            [indexAtDNA addObject:[NSNumber numberWithInt:i]];
        }
        
        // определяем сколько ячеек нам надо заменить
        long change_count = lround(X * DNA_LENGTH / 100);
        for (int i=0; i<change_count; i++) {
            // выбираем случайную ячейку из списка на замену
            int randomIndex = (random() % (int)[indexAtDNA count]);
            // получаем индекс ячейки
            int randomIndexAtDNA = [[indexAtDNA objectAtIndex:randomIndex] intValue];
            // удаляем ячейку из списка замены
            [indexAtDNA removeObjectAtIndex:randomIndex];
            // заменяем в выбраной ячейке случайным нуклеотидом
            [DNA replaceObjectAtIndex:randomIndexAtDNA withObject:[@"" randomNucleotide:[DNA objectAtIndex:randomIndexAtDNA]]];
        }
    }
}

@end

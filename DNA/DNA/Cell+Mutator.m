//
//  Cell+Mutator.m
//  DNA
//
//  Created by Pavel Krishtalskiy on 08.11.12.
//  Copyright (c) 2012 Pavel Krishtalskiy. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (mutator)
-(void) mutate: (int)nucleotids{
    if (nucleotids < 0  ||  nucleotids > 100)
        @throw [NSException exceptionWithName:NSRangeException reason:@"Percentage value should be between 0 and 100." userInfo:nil];
    
    if (nucleotids == 0)
    {
        //      Если указано значение ноль, то заменять ничего не нужно. Завершаем мутацию без изменений в клетке
        return;
    }
    
    //  Определяем целое количество нуклеотидов, которые необходимо заменить
    int nucleotidsCount = ([self cellLength] * nucleotids) / 100;
    //    NSLog(@"Nucleotids to be mutated: %i.", nucleotidsCount);
    
    int k;
    NSNumber *position;
    NSMutableArray *mutableNucleotids = [NSMutableArray arrayWithCapacity:nucleotidsCount], *newDNA = [NSMutableArray arrayWithArray:[self DNA]];
    //  Из интервала [0; cellLength - 1] выбираем nucleotidsCount целых чисел, которые будут обозначать позиции нуклеотидов, которые необходимо мутировать
    for (int j = 0; j < nucleotidsCount;)
    {
        //      Произвольно выбираем номер позиции в интервале от ноля до «cellLength - 1»
        k = arc4random() % [self cellLength];
        position = [NSNumber numberWithInt:k];
        //      Если такого значениея в массиве еще нет, то
        if(![mutableNucleotids containsObject:position])
        {
            //          добавляем это значение в массив, чтобы более в следующих итерациях уже не менять это позицию
            [mutableNucleotids addObject:position];
            //          и заменяем соответствующий нуклеотид
            [newDNA replaceObjectAtIndex:k withObject:[charSet objectAtIndex:(([charSet indexOfObject:[[self DNA] objectAtIndex:k]] + 1 + arc4random()%3)%4)]];
            j++;
        }
    }
    
    //  Заменяем старый ДНК на новый
    [self setDNA:newDNA];
    
    //    NSLog(@"%@", mutableNucleotids);
}
@end

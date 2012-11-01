//
//  main.m
//  dnk
//
//  Created by ssein on 30.10.12.
//  Copyright (c) 2012 ssein. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

// мутатор
@interface Cell ( mutator )
-(void) mutate: (int) percent;
@end

@implementation Cell (mutator)

// Мутация цепочки
-(void)mutate:(int)percent {
    // Ничего не делаем, если процент в некорректном диапазоне
    if(percent < 0 || percent > 100 ) return;

    int replaceElementsCount = percent * DNA_SIZE / 100;
    NSMutableArray *unreplaced_indexes = [NSMutableArray arrayWithCapacity:DNA_SIZE];
    for (int i = 0; i < DNA_SIZE; i++) {
        [unreplaced_indexes addObject:@(i)];
    }
    // заданное кол-во раз изменяем случайный элемент
    for (int mutate_i = replaceElementsCount; mutate_i > 0; mutate_i--) {
        // получаем случайный индекс элемента
        int newReplaceIndex = arc4random() % unreplaced_indexes.count;
        // заменяем элемент с этим индексом на случайный
        int element_index = [[unreplaced_indexes objectAtIndex: newReplaceIndex] intValue];
        [self.dna replaceObjectAtIndex: element_index withObject:[Cell getAnotherRandomElement: self.dna[element_index]]];
        // Удаляем изменный индекс
        [unreplaced_indexes removeObjectAtIndex:newReplaceIndex];
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // объявление переменных
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        // вывод исходных цепочек
        [cell1 print];
        [cell2 print];
        
        // вывод разницы, между цепочками
        NSLog(@"hamming distance = %i",[cell1 hammingDistance:cell2]);
        
        // мутируем
        [cell1 mutate:5];
        [cell2 mutate:7];

        // вывод мутировавших цепочек
        [cell1 print];
        [cell2 print];

        // вывод разницы, между мутировавшими цепочками
        NSLog(@"hamming distance = %i",[cell1 hammingDistance:cell2]);
    }
    return 0;
}


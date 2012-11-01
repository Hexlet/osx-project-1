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
    // заданное кол-во раз изменяем случайный элемент
    for (int mutate_i = 0; mutate_i < percent; mutate_i++) {
        // получаем случайный индекс элемента
        int replaceIndex = arc4random() % DNA_SIZE;
        // заменяем элемент с этим индексом на случайный
        [self.dna replaceObjectAtIndex:replaceIndex withObject:[Cell getRandomElement]];
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


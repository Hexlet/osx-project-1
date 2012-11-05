//
//  CellMutator.m
//  DNA
//
//  Created by NordWind on 05.11.12.
//  Copyright (c) 2012 YurySokolov. All rights reserved.
//

#import "CellMutator.h"

// Реализуем мутатор класса Cell
@implementation Cell(mutator)

// Описываем метод, позволяющий заменить n% от ДНК
-(void) mutate:(int) percent {
    
    // Если persent больше 100 - то 100 (зачем менять то что уже изменено)
    if (percent > 100) { percent = 100; }
    
    //Вычисляем количество элементов подверженных мутации
    double cnt = round( ([self nucleotideCount] * percent) / 100 );
    int mutableElementCount =  (int) cnt;

    NSLog(@"Будет подверженно мутации %d процентов, что составляет %d элемента(ов) ДНК", percent, mutableElementCount);
    
    // А если cnt = 0 то и менять ничего не нужно
    if (cnt == 0) { return; }
    
    // Создаем массив, в котрый будем записывать факт изменения основного массива
    NSMutableArray *changed = [[NSMutableArray alloc] initWithCapacity:mutableElementCount];
    // В цикле для каждого значения
    
    for (int i=0; i<mutableElementCount; i++) {
        
        BOOL ready = NO;
        // Заменяем массив, проверяя был ли он изменен
        
        do {
            
            NSNumber *dnaPos = [NSNumber numberWithInt:arc4random()%self.nucleotideCount];
            
            // И если массив изменений не содержит сгенерированного значения то заменим его
            if (![changed containsObject:dnaPos]) {
                
             
                [self.DNA replaceObjectAtIndex:[dnaPos intValue] withObject: [self.nucleotide objectAtIndex:arc4random()%[self.nucleotide count]]];
                // Добавляем в массив значение индекса позиции днк, что уже меняли
                [changed addObject:dnaPos];
                // Выходим из цикла
                ready = YES;
            }
            // А и наче все сначала..
            
        } while (!ready);
    }
    
    //NSLog(@"%@", changed);
    changed = NULL;
    
    
}

@end

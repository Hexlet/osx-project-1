//
//  Cell+mutator.m
//  Cell
//
//  Created by Игорь Алюшев on 02.11.12.
//  Copyright (c) 2012 Игорь Алюшев. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void)mutator:(int)x{
    /* здесь будем хранить массив индексов элементов, из которых будем делать выбор для мутации */
    NSMutableIndexSet *contender=[[NSMutableIndexSet alloc]initWithIndexesInRange:NSMakeRange(0, elements)];
    
    int counter=0;//заведем счетчик уже мутированных элементов
        
    while(counter<x){ //замена еще в процессе
        int index=arc4random() % [contender count]; //получим случайный индекс

        // получим новый элемент
        NSString *newValue=[self getRandomChar];
        //убедимся, что значение принципиально другое. Если нет - выберем другое
        while([self.dna[index] isEqual: newValue]) newValue=[self getRandomChar];
            
        //заменим символ
        [self.dna replaceObjectAtIndex:index withObject:newValue];
        
        //удалим индекс уже использованного элемента из списка кандидатов
        [contender removeIndex:index];
            
        counter++;
        
    }
}


@end

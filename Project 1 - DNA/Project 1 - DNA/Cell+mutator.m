//
//  Cell+mutator.m
//  Project 1 - DNA
//
//  Created by Дмитрий Кузнецов on 09.11.12.
//  Copyright (c) 2012 Dmitriy Kuznetsov. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void)mutate:(int)mutationLevel {
    
    if (mutationLevel<=0) {
        return;
    }
    
    if (mutationLevel>100) {
        mutationLevel = 100;
    }
    
    //Пересчитываем уровень мутации для произвольной длины цепочки
    mutationLevel = mutationLevel*DNA_LENGTH/100;
    
    //Создаем массив с индексами
    NSMutableArray *indexArray = [[NSMutableArray alloc]initWithCapacity:DNA_LENGTH];
    for (int i=0; i<DNA_LENGTH; i++) {
        [indexArray addObject:[NSNumber numberWithInt:i]];
    }
    
    //Перемешиваем массив
    for (int initialPosition=0; initialPosition<DNA_LENGTH; initialPosition++) {
        int resultPosition = arc4random()%DNA_LENGTH;
        [indexArray exchangeObjectAtIndex:initialPosition withObjectAtIndex:resultPosition];
    }
    
    
    for (int i=0; i<mutationLevel; i++) {
        //Проверяем пуст массив или нет
        if (indexArray) {
            
            //берем последний элемент из перемешанного массива индексов.
            int indexToMutate = [[indexArray lastObject]intValue];
            //Выбираем случайную мутацию
            NSString *mutation = baseDNAElements[arc4random()%4];
            
            //Если мутация совпала с тем, что надо заменить, то выбираем снова до тех пор, пока не подберем нужный
            while ([[self.dna objectAtIndex:indexToMutate] isEqualToString:mutation]) {
                mutation = baseDNAElements [arc4random()%4];
            }
            
            //Заменяем элемент днк по случайному индексу
            [self.dna replaceObjectAtIndex:indexToMutate withObject:mutation];
            
            //Удаляем последний элемент из массива индексов
            [indexArray removeLastObject];
        }
        
    }
    
}

@end

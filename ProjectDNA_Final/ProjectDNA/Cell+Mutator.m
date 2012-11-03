//
//  Cell+Mutator.m
//  ProjectDNA
//
//  Created by Anton Samoylov on 03.11.12.
//  Copyright (c) 2012 Anton Samoylov. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void)mutate:(int)percent {
    //Если процент некорректный то убиваем метод
    if(percent < 0 || percent > 100 ) return;
    
    int replaceCount = DNACapacity*0.01*percent;
    NSMutableArray *unreplaced_indexes = [NSMutableArray arrayWithCapacity:DNACapacity];
    for (int i = 0; i < DNACapacity; i++) {
        [unreplaced_indexes addObject:@(i)];
    }
    //Заменяем элементы replaceCount раз
    for (int mutate_i = replaceCount; mutate_i > 0; mutate_i--) {
        //Геним случайный элемент
        int nIndexForReplace = arc4random() % [unreplaced_indexes count];
        //Получаем из базы индекс от случайного элемента
        int elementIndex = [[unreplaced_indexes objectAtIndex: nIndexForReplace] intValue];
        //Заменяем элемент в массиве ДНК на случайный
        [DNA replaceObjectAtIndex: elementIndex withObject:[Cell getRandomElement: DNA[elementIndex]]];
        //Удаляем замененынй индекс из базы
        [unreplaced_indexes removeObjectAtIndex:nIndexForReplace];
    }
}

@end

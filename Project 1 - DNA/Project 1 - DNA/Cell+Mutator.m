//
//  Cell+Mutator.m
//  Project 1 - DNA
//
//  Created by Artemati on 11.11.12.
//  Copyright (c) 2012 Artemati. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)
-(void)mutate:(int)percentsForMutator {
    // Массив для хранения случайных индексов
    NSMutableArray *rangeOfIndex = [NSMutableArray arrayWithCapacity:percentsForMutator];
    // Так как массив у нас из 100 символов, то кол-во итераций равно кол-ву процентов
    for (int i=0; i<percentsForMutator; i++) {
        // Получаем символ, который хотим заменить
        NSString *symbolOfDNA = [self.dna objectAtIndex:i];
        // Получаем рандомный символ
        NSString *symbolToReplace = [self randomSymbol];
        // Если рандомный символ равен текущему, получаем еще...
        while (symbolOfDNA == symbolToReplace) {
            symbolToReplace = [self randomSymbol];
        }
        // Получаем случайный индекс для замены в нашей днк
        int index = arc4random()%100;
        // Переведем этот этот индекс в NSNumber, чтобы найти его в нашем массиве
        NSNumber *indexNumber = [NSNumber numberWithInt:index];
        /* Смотрим, содержит ли наш массив случайные индекс, есди да -
         получаем новый случайный индекс и т.д.*/
        while ([rangeOfIndex containsObject:indexNumber]) {
            index = arc4random()%100;
            indexNumber = [NSNumber numberWithInt:index];
        }
        // Заменяем на радномный символ по случайному индексу
        [self.dna replaceObjectAtIndex:index withObject:symbolToReplace];
        [rangeOfIndex addObject:[NSNumber numberWithInt:index]];
        
    }
}
@end

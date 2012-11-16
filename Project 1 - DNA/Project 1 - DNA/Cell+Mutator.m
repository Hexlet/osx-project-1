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
    
    // Проверим, что проценты попадают в диапозон
    if (percentsForMutator>0 && percentsForMutator<=100) {
        // Массив для хранения случайных индексов
        NSMutableArray *rangeOfIndex = [NSMutableArray arrayWithCapacity:percentsForMutator];
        // Определим сколько итераций необходимо сделать для замены в ДНК
        int iterations = round(percentsForMutator*lenthOfDna/100);
    
        for (int i=0; i<iterations; i++) {
            
            // Получаем случайный индекс для замены в нашей днк
            int index = arc4random()%lenthOfDna;
            // Переведем этот этот индекс в NSNumber, чтобы найти его в нашем массиве
            NSNumber *indexNumber = [NSNumber numberWithInt:index];
            
            /* Смотрим, содержит ли наш массив случайные индекс, есди да -
             получаем новый случайный индекс и т.д.*/
            while ([rangeOfIndex containsObject:indexNumber]) {
                index = arc4random()%lenthOfDna;
                indexNumber = [NSNumber numberWithInt:index];
            }
            
            // Получаем символ, который хотим заменить
            NSString *symbolOfDNA = [self.dna objectAtIndex:index];
            // Получаем рандомный символ
            NSString *symbolToReplace = [self randomSymbol];
            // Если рандомный символ равен текущему, получаем еще...
            while (symbolOfDNA == symbolToReplace) {
                symbolToReplace = [self randomSymbol];
            }
            
            // Заменяем на радномный символ по случайному индексу
            [self.dna replaceObjectAtIndex:index withObject:symbolToReplace];
            [rangeOfIndex addObject:[NSNumber numberWithInt:index]];
            
        }
    }
    
    
}
@end

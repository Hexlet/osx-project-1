//
//  main.m
//  Project 1 - DNA
//
//  Created by Artemati on 08.11.12.
//  Copyright (c) 2012 Artemati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (MUTATOR)
-(void)mutate;
@end

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

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1;
        Cell *cell2;
        
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
       
        NSLog(@"\nHamming distance %d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:20];
        [cell2 mutate:40];
        
        NSLog(@"\nHamming distance with mutation %d", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}


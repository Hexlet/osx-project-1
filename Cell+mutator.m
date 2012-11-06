//
//  Cell+mutator.m
//  DNAProject
//
//  Created by Maxim Tushevskiy on 05.11.12.
//  Copyright (c) 2012 Maxim Tushevskiy. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
-(void)mutate:(int) percent{
    NSNumber *aIndex = 0;
    NSString *letter = @"";
    NSMutableArray *mutateSellection = [NSMutableArray array]; // Массив мутированных ячеек
    
    while (percent != 0) {
        
        aIndex = [NSNumber numberWithInt:(arc4random()%[DNA count])]; // Выбераем случайный элемент
        if ([mutateSellection containsObject:aIndex]) { // Если ячейка уже менялась выбрать другую
            continue; 
        }
        
        do { //  Подбираем новое значение не совподающее со старым
            letter = [letters objectAtIndex:arc4random()%4];
        } while (letter == [DNA objectAtIndex:[aIndex intValue]]);
        
        [DNA removeObjectAtIndex:[aIndex intValue]];          // Удалеяем старый элемент из цепочки
        [DNA insertObject: letter atIndex:[aIndex intValue]]; // добавляем мутированый
        
        [mutateSellection addObject:aIndex]; // Добавляем индекс в массив мутированных ячеек
        
        percent--; // Уменьшаем счетчик процентов
    }
}
@end

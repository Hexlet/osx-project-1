//
//  Cell+mutator.m
//  Project 1 DNA
//
//  Created by bashtannik on 03.11.12.
//  Copyright (c) 2012 bashtannik. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

/*
 
 Мутация X процентов 
 
 X - int процент изменяемых элементов массива
 
 */
-(void)mutate:(int) X {
    
    NSUInteger amount = X*self.DNA.count/100; // Проценты

    NSMutableArray *history = [NSMutableArray array]; // Используем для уникальности заменяемых символов
    
    for(int i=0; i<amount; i++){
    
        NSNumber *random =[NSNumber numberWithInt:arc4random() % amount];
        
        NSString *ch = [self.DNA objectAtIndex:random.intValue]; // Объект на замену
        
        if([history indexOfObject:ch] != NSNotFound) { // Если уже заменяли этот элемент
            i--;
            continue; //снова пройдемся
        }
        
        /*
         Почему-то было решено, что элементы массива должны быть
         именно заменены, при этом не предполагается, что случайный
         символ на то и случайный, что может совпасть. Очевидны
         неточности в задании.
         
         Поэтому используется метод randomCharExclude:ch, генерирующий
         случайный символ за исключением переданного в параметре, в
         данном случае - текущего.
         */

        // Если соблюдать условие полной случайности, нужно закомментировать след. линию
        
        [self.DNA replaceObjectAtIndex:random.intValue withObject:[Cell randomCharExclude:ch]];
        
        // и раскоментировать эту:
        //[self.DNA replaceObjectAtIndex:random.intValue withObject:[Cell randomChar]];
        
        [history addObject:random]; // Добавим индекс объекта в историю
        
    }

}

@end
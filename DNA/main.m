//
//  main.m
//  DNA
//
//  Created by Vadim Yazvinskiy on 11/4/12.
//  Copyright (c) 2012 Vadim Yazvinskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)

-(void) mutate:(int)percent;

@end

@implementation Cell (Mutator)

-(void) mutate:(int)percent{
    //Создаю изменяемый массив для хранения состояния индексов.
    NSMutableArray *arrayIndex = [[NSMutableArray alloc] init];
    
    //Заполняю его "не измененными" состояниями.
    for (int i = 0; i < 100; i++) {
        [arrayIndex insertObject:@NO atIndex:i];
    }
    
    int i = 0;
    while (i != percent) {
        //Генерирую случайный индекс.
        int randomIndex = arc4random() %100;
        
        //Проверяю состояние сгенерированного случайного индекса, если состояние не менялось, то...
        if (arrayIndex[randomIndex] == @NO) {
            
            //Создаю множество символов.
            NSMutableArray * arrayChar = [NSMutableArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
            
            //Нахожу и удаляю символ из множества символов,
            //который есть по сгенерированному случайному индексу в молекуле ДНК.
            [arrayChar removeObject:[self.DNA objectAtIndex:randomIndex]];
            
            //Меняю символ по сгенерированному случайному индексу другим случайным символом из оставшихся.
            [self.DNA replaceObjectAtIndex:randomIndex withObject:arrayChar[arc4random() %3]];
            
            //Меняю состояние сгенерированного случайного индекса на "измененное"
            [arrayIndex replaceObjectAtIndex:randomIndex withObject:@YES];
            
            //Увеличиваю счетчик на единицу.
            i++;
        }
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *myCell, *anotherCell;
        
        //Создаю две клетки.
        myCell = [[Cell alloc] init];
        anotherCell = [[Cell alloc] init];
        
        //Вывод на печать hammingDistance между кдетками.
        NSLog(@"Hamming distance: %i", [myCell hammingDistance:anotherCell]);
        
        //Мутирую клетки.
        [myCell mutate:5];
        [anotherCell mutate:8];
        
        //Вывод на печать hammingDistance мутированных клеток.
        NSLog(@"Hamming distance: %i", [myCell hammingDistance:anotherCell]);
        
    }
    return 0;
}


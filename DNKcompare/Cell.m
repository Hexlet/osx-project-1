//
//  Cell.m
//  DNKcompare
//
//  Created by VladIslav Khazov on 07.11.12.
//  Copyright (c) 2012 VladIslav Khazov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

//Изменяем стандартный метод init
- (id) init {
    if (sizeDNA<1) {
        NSLog(@"ДНК не может быть меньше 1. Вы убили ее!!!");
        exit(0);
    }
    //вызов родительского метода
    self = [super init];
    if (self) {
        //Создаем временный массив
        NSArray *arrayCode = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        //Определяем размерность нашего массива
        _DNA = [[NSMutableArray alloc] initWithCapacity:sizeDNA];
        //Заполняем массив
        for (int i=0; i<=sizeDNA-1; i++) {
            //Добавляем объект в массив DNA, используя случайное число от 0 до 3, как индекс для массива arrayCode
            [_DNA addObject:[arrayCode objectAtIndex:arc4random_uniform(4)]];
        }
    }
    return self;
}

-(int) hammingDistance: (Cell *) otherCell{
    //Счетчик совпадений
    int count = 0;
    // [otherCell DNA] возвращает свойство второго Cell, Обращаемся к нему как к NSMutableArray
    for(int i=0;i<=sizeDNA-1;i++){
        //Проверяем на совпадение
        if ([[otherCell DNA] objectAtIndex:i]!=[_DNA objectAtIndex:i]) {
            count++;
        }
    }
    return count;
}

@end

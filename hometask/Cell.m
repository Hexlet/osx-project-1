//
//  Cell.m
//  hometask
//
//  Created by Дмитрий Голубев on 05.11.12.
//  Copyright (c) 2012 Дмитрий Голубев Inc. All rights reserved.
//

#import "Cell.h"
#define DNAEL 100 // макрос для 100 ячеек

@implementation Cell // имплементация (реализация) класса Cell

static int _randNumber; // статическая переменная для создания разного результата рандома


-(int)hammingDistance:(Cell *)c
{

    int distance = 0;
    for (int i = 0; i < DNAEL; i++) {
        
        if ([self.DNA objectAtIndex:i] != [c.DNA objectAtIndex:i]) // если ячейки разные, пишим номер ячейки
                                                                   // в distance и прирываем цыкл
        {
            distance = i;
            break;
        
        };
    }
    
    return distance; // возращаем результат
}


-(id)init
{
    self = [super init]; // вызываем родителеский метод и пишим в переменную self
    
    if (self)
    {
        _randNumber += (int)time(NULL); // получаем какое-то значение отличное от 0 и 
        srand (_randNumber);            // используем его в srand, для различного рандома
        
        _DNA = [NSMutableArray arrayWithCapacity:DNAEL]; // создаем объект изменяемого массива размером 100 ячеек
        
        NSArray * array = [NSArray arrayWithObjects: @"A", @"T", @"G", @"С", nil]; // алфавит ячеек
        NSUInteger numberoOfElements = [array count]; // Посылаем сообщение count для получения кол-во ячеек     
        for (int i = 0; i < DNAEL; i++)
        {
            [_DNA insertObject:[array objectAtIndex:(rand() % numberoOfElements)] atIndex:i]; // заполняем наш ДНК
        }
    
    }
    
    return self;
}

@end

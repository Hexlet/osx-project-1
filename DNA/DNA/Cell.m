//
//  Cell.m
//  DNA
//
//  Created by NordWind on 05.11.12.
//  Copyright (c) 2012 YurySokolov. All rights reserved.
//

#import "Cell.h"


@implementation Cell

//Согласно условиям задачи у нас 100 нуклеотидов в последовательности
 


// Приватный метод для отладки. Выводит значение массива с ДНК
-(void)printDNAValue
{
    NSLog(@"%@", _DNA);
}


// Переопределяем инит для этого класса. Фактически это конструктор, где мы не только запускаем
// инит метод родителя но и выполняем какие то свои действия
-(id)init {
    
    // Просим выполнить метод инит у родителя NSObject и назначаем переменную self
    self = [super init];
    // Убеждаемся, что self не пустой или не равен null
    if(self){
        
        // Устанавливаем значение количества нуклеотидов в клетке
        _nucleotideCount = 100;
        
        // Выполняем наши действия по инициализации массива DNA из 100 объектов
        // Инициализируем массив ДНК c 100 элементами
        _DNA = [[NSMutableArray alloc] initWithCapacity:_nucleotideCount];
        
        // Инициализируем массив нуклеотидов. Не забываем про терминатор.
        _nucleotide = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        
        // В цикле от 0 до 100 заполняем свежесозданный массив случайными значениями нкулеотидов 
        for (int i=0; i<_nucleotideCount; i++) {
            
            // Стандартный рандом не справился со совей задачей - постоянно выдает те же самые значения.
            //[_DNA addObject:[nucleotide objectAtIndex:random()%[nucleotide count]]];
            
            // Практика показала, что этот рандом поточнее =)
            [_DNA addObject:[_nucleotide objectAtIndex:arc4random()%[_nucleotide count]]];
        }
        
    }
    
    //[self printDNAValue];
    
    return self; 
}

// Метод рассчитывает количество изменений ДНК относительно родной.
// Принимает объект и возвращает количество мутаций
-(int)hammingDistance:(Cell *)obj
{
    int distance = 0;
    // Просто сравниваем значения и если они различны, увеличиваем счетчик
    for (int i=0; i< [_DNA count]; i++) {
        if( [_DNA objectAtIndex:i] != [ obj.DNA objectAtIndex:i] )
        { distance ++; }
    }
    return distance;
}


@end
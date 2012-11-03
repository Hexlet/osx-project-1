//
//  Cell.m
//  Project1DNK
//
//  Created by Sergey on 02.11.12.
//  Copyright (c) 2012 Sergey. All rights reserved.
//

#import "Cell.h" // импортируем хеддер файл

@implementation Cell // реализация класса Cell

-(id) init { // переопределяем метод init класса
    self = [super init]; // вызываем метод init родителя
    if (self) { // если все прошло успешно
        arrayATGC = [[NSMutableArray alloc] initWithObjects:@"A", @"T", @"G", @"C",nil]; // создаем массив со значениями A T G C  которые могут принимать ячейки ДНК
        _DNA = [[NSMutableArray alloc] init]; // выделяем память и инициализируем ДНК
        for (int i=0; i<100; i++) { // заполняем в цикле от 0 до 99 значения массима ДНК
            [_DNA addObject:[arrayATGC objectAtIndex: arc4random() % 4]]; // добавляем в массив ДНК значения из массива arrayATGC по случайным значениям от 0 до 3 используя  arc4random() % 4
        }
    }
    return self; // возвращаем self
}

-(int) hammingDistance:(Cell*) c { // реализуем метод hammingDistance класса Cell,который возвращает int и принимает объект класса Cell и возвращает количество позиций где символы ДНК не совпадают.
    int counthammingDistance = 0; // добавляем новую переменную int counthammingDistance - количество позиций где символы ДНК не совпадают
    for ( int i=0; i<100; i++) { // перебираем в цикле от 0 до 99 значения массивов ДНК
        if (![[_DNA objectAtIndex:i] isEqualToString: [c.DNA objectAtIndex: i]]) { // если значения яцейки i  массивов ДНК не совпали 
           counthammingDistance ++; //то увеличиваем значение counthammingDistance на 1;
        }
    }
    return counthammingDistance; //возвращам количество позиций где символы ДНК не совпадают.
}

@end

//
//  Cell.m
//  DNA
//
//  Created by Georgiy Mostolovitsa on 31.10.12.
//  Copyright (c) 2012 Georgiy Mostolovitsa. All rights reserved.
//

#import "Cell.h"

@implementation Cell


// Создаёт и возвращает объект класса Cell с дефолтным
// количеством нуклеотидов
- (id)init {

    self = [super init];

    if (self)
        [self fillCellWithCapacity:100];

    return self;

}


// Создаёт и возвращает объект класса Cell с произвольным
// количеством нуклеотидов
- (id)initWithCapacity:(int)numItems {

    self = [super init];

    if (self)
        [self fillCellWithCapacity:numItems];

    return self;

}


// Возвращает случайный нуклеотид
- (id)getRandomNucleotide {
    return [_nucleotides objectAtIndex:arc4random() % _nucleotides.count];
}


// Заполняет ДНК переданным количеством нуклеотидов
- (void)fillCellWithCapacity:(int)numItems {

    // Массив с возможными видами нуклеотидов. По-хорошему,
    // это наверное должна быть константа, но я понял как её сделать
    _nucleotides = [[NSArray alloc] initWithObjects:@"A", @"G", @"C", @"T", nil];

    // Инициализация ДНК
    DNA = [[NSMutableArray alloc] init];

    // Переданное количество раз
    for(int index = 0; index < numItems; index++)

        // Добавляем в ДНК нуклеотид
        [DNA addObject:[self getRandomNucleotide]];

}


// Считает количество различий в цепочках ДНК
- (int)hammingDistance:(Cell *)anotherCell {

    int count = 0;                                          // Переменная для хранения найденных различий
    int checkLength = (int)[[anotherCell getDNA] count];    // Количество элементов, которое можно сравнивать

    // Проверяем, что в переданном объекте нуклеотидов не меньше чем у нас
    if (DNA.count < checkLength)
        checkLength = (int)DNA.count;

    // Разницу в длине ДНК тоже считаем за несовпадение
    count = abs((int)[DNA count] - (int)[[anotherCell getDNA] count]);

    // Проходимся по нашей цепочке текущего инстанса
    for (int index = 0; index < checkLength; index++)

        // Сравниваем нуклеотиды
        if ([[DNA objectAtIndex:index] isNotEqualTo:[[anotherCell getDNA] objectAtIndex:index]])
            count = count + 1;


    return count;

}


// Геттер для ДНК
- (id)getDNA {
    return DNA;
}


// Метод позволяющий заменить определённый нуклеотид
- (void)replaceAtIndex:(int)index withObject:(id)object {
    [DNA replaceObjectAtIndex:index withObject:object];
}

@end

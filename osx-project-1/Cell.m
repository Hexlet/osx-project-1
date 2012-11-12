//
//  Cell.m
//  osx-project-1
//
//  Created by Alex Bakoushin on 09.11.12.
//  Copyright (c) 2012 Alex Bakoushin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init {

    // Стандартная инициализация класса
    if (self = [super init]) {
        
        // Инициализация свойства DNA (массив)
        _DNA = [[NSMutableArray alloc] initWithCapacity: DNA_LENGTH];
        
        // Заполнение массива DNA случайными буквам из строки "ATGC"
        for (int i = 0; i <= DNA_LENGTH; i++) {
            
            // Вычисление случайной буквы
            NSString *randomLetter = [NSString stringWithFormat:@"%C", [LETTERS characterAtIndex: arc4random() % [LETTERS length]]];
            
            // Добавление полученной буквы в массив
            [_DNA addObject: randomLetter];

        };

    }
    
    return self;

}

-(int) hammingDistance: (Cell*)cell {

    // Инициализация возвращаемой методом переменной
    int hammingDistance = 0;
    
    // Цикл по каждому элементу обеих массивов
    for (int i = 0; i <= DNA_LENGTH; i++) {
        
        // Получение буквы по индексу из собственного массива DNA текущего объекта
        NSString *letter1 = [_DNA objectAtIndex: i];
        
        // Получение буквы по индексу из массива DNA объекта, переданного в параметре
        NSString *letter2 = [cell->_DNA objectAtIndex: i];
        
        // Проверка на неравенство и увеличение расстояния Хэмминга
        if (letter1 != letter2) hammingDistance++;
        
    }
    
    return hammingDistance;
}

@end

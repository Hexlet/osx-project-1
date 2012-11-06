//
//  Cell.m
//  DNA
//
//  Created by Dmitriy Zhukov on 06.11.12.
//  Copyright (c) 2012 Dmitriy Zhukov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init {
    
    self= [super init];
    
    if (self) {
        
        self.arrayCapacity = 10; //Устанавливаем размер массива (При кастомном ините значение можно передавать)
        self.rangeOfDNACellValues = @"ATGC"; // Устанавливаем диапазон возможных значений для ячейки ДНК
        self.DNA = [NSMutableArray arrayWithCapacity:self.arrayCapacity]; //Создаем массив с помощью конструктора с начальным размером "arrayCapacity"
        
        for (unsigned int i = 0 ; i < self.arrayCapacity; i++) { //Последовательно заполняем массив
    
        [self.DNA addObject:[NSString stringWithFormat:@"%C", [self.rangeOfDNACellValues characterAtIndex: arc4random() % [self.rangeOfDNACellValues length]]]]; //Добавляем к массиву объект являющийся символом строки rangeOfDNACellValues по случайному индексу из диапазона "[self.rangeOfDNACellValues length]"
        }
    }
    return self;
}

- (unsigned int) hammingDistance: (Cell*) anotherDNA {
    unsigned int count = 0; // Устанавливаем счетчик различий на "0"

    for (int i = 0 ; i < self.arrayCapacity; i++) { // Последовательно подсчитываем различия
        
        if ([self.DNA objectAtIndex: i] != [anotherDNA.DNA objectAtIndex: i]) {  // Если объекты массивов по одинаковому индексу не равны тогда
            count++; // Увеличиваем счетчик различий на единицу
        }
    }
   
    return count;
}

@end

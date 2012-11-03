//
//  Cell.m
//  DNApp
//
//  Created by Oleksandr Gnatisin on 02.11.12.
//  Copyright (c) 2012 Oleksandr Gnatisin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    
    if (self) {
        _randomArray = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil]; // Инициализация массива, который содержит буквенные указатели
        
        _dna = [[NSMutableArray alloc] init]; // Инициализация массива ДНК
        
        // Цикл, в котором мы рандомно присваиваем значения каждому из 100 елементов массива ДНК
        for (int i = 0; i < 100; i++) {
            
        [_dna addObject:[self getRandom]]; // Сам метод добавления обектов в массив ДНК
            
        }
    }
    
    return self;
}

- (NSString *) getRandom {
    int r = arc4random() % 4; // генерирует рандом из 4 значений
        
      // Сам метод добавления обектов в массив ДНК    
    NSString *randomString =  [_randomArray objectAtIndex:r];    
    
    return randomString;
}

  

// Имплеминтация метода hammingDistance:
- (int) hammingDistance:(Cell *) cell {
    int count = 0; // создаем переменную счетчик со значением 0
    
    // Теперь в цикле проверяем на несовпадения в двух массивах, при нахождении несовпадения увеличеваем счетчик на 1
    for (int i = 0; i < 100; i++) {
        if (![[cell.dna objectAtIndex:i] isEqualToString:[_dna objectAtIndex:i]]) {
            count ++;
        }
    }
    
    return count;
}

@end

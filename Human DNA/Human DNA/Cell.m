//
//  Cell.m
//  Human DNA
//
//  Created by Dmitry Marenich on 11/4/12.
//  Copyright (c) 2012 Dmitry Marenich. All rights reserved.
//

#import "Cell.h"


@implementation Cell 
// В классе Cell cоздаем переменную DNA типа NSMutableArray
    NSMutableArray *humanDNA;


// Создадим собственный метод init
-(id) init {
    self = [super init];
    if (self) {

        // Инициализация массива под символьные значения
        _arrayOfChars = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        _DNA = [self createDNA];
        }
        return self;
    }

// Создаем DNA
-(id) createDNA {
    NSMutableArray *humanDNA = [[NSMutableArray alloc] initWithCapacity:100];
    for (int i = 0; i < 100; ++i) {
   
        // Заполняем 'humanDNA'-массив, случайно сгенерированными символами
        [humanDNA addObject:[_arrayOfChars objectAtIndex:arc4random()%4]];
    }
    // Возвращаем заполненный 100 символами массив 'humanDNA'
    return humanDNA;
}

// метод сравнивает свой DNA и DNA переданного в качестве аргумента объекта и
// возвращать количество позиций, где символы DNA не совпадают.
-(int) hammingDistance:(Cell *)cell {
    int diffOfDNA = 0;
    for (int n = 0; n < 100; ++n) {
        if ([[cell DNA] objectAtIndex:n] !=[_DNA objectAtIndex:n]) {
            ++diffOfDNA;
        }
    }
    // Возвращаем количественную разницу между DNA
    return diffOfDNA;
}
@end

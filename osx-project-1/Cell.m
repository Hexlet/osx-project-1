//
//  Cell.m
//  osx-project-1
//
//  Created by Eugene Krymov on 03.11.12.
//  Copyright (c) 2012 ekrymov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init {                 // Создаем собственную реализацию метода init
    self = [super init];
    if (self) {
        _DNA = [NSMutableArray array]; // Массив для заполнения символами
        _symbols = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil]; // Массив символов 
        NSUInteger randomIndex;
        for (int i=0; i<100; i++) {    // Заполняем 100 ячеек массива DNA случайными символами из массива symbols
            randomIndex = arc4random() % [_symbols count];
            [_DNA addObject:[_symbols objectAtIndex:randomIndex]];
        }
    }
    return self;
}

-(int)hammingDistance:(Cell *) f { // Метод для сравнения двух ДНК
    int distance = 0;              // Начальное количество разных символов
    
    for (int i=0; i < [self.DNA count]; i++) { // Перебираем все символы в массивах ДНК-1 и ДНК-2
        if ([self.DNA objectAtIndex:i] != [f.DNA objectAtIndex:i]) { // Если символы не совпадают
            distance++;                                              // увеличиваем переменную на 1
        }
    }
    return distance; // Возвращаем количество несовпадающих символов
}

@end

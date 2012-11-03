//
//  Cell.m
//  DNA
//
//  Created by Pavel Krishtalskiy on 03.11.12.
//  Copyright (c) 2012 Pavel Krishtalskiy. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>

@implementation Cell
// Переопределяем метод init для начальной инициализации класса Cell
-(id) init {
// Сначала выполняем init метод суперкласса, затем …
    self = [super init];
// если инициализация выполнена успешно …
    if (self) {
// определяем размер массива DNA в 100 элементов и
        _cellLength = 100;
        _DNA = [NSMutableArray arrayWithCapacity:_cellLength];

// заполняем его случайным образом символами A, T, G и C
        int symbol;
        for (int i = 0; i < _cellLength; i++)
        {
            symbol = arc4random() % 4;
            switch (symbol) {
                case 0:
                    [_DNA addObject:@"A"];
                    break;

                case 1:
                    [_DNA addObject:@"T"];
                break;
                    
                case 2:
                    [_DNA addObject:@"G"];
                break;

                default:
                    [_DNA addObject:@"C"];
                    break;
            }
        }
    }  
    return self;
}

- (int) hammingDistance:(Cell*)cell{
    NSMutableArray *m = cell.DNA;
    
    // Счетчик совпадений
    int count = _cellLength;

    // Посимвольно сравниваем cellLength элементов первой и второй ДНК
    for (int i = 0; i < _cellLength; i++)
    {
        if ([[_DNA objectAtIndex:i] isEqualToString:[m objectAtIndex:i]]) {
            count--;
        }
//        NSLog(@"i = %i", i);
//        NSLog(@"    %@", [_DNA objectAtIndex:i]);
//        NSLog(@"    %@", [m objectAtIndex:i]);
//        NSLog(@"    %i", count);
    }
    return count;
}


//-(void) printDNA{
//    NSLog(@"%@", _DNA);
//}

@end


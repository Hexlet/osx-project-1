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
        charSet = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        for (int i = 0; i < _cellLength; i++)
        {
            [_DNA addObject:[charSet objectAtIndex:(arc4random() % 4)]];
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
    }
    return count;
}

-(void) printDNA{
    NSLog(@"Cell is %@", [_DNA componentsJoinedByString:@""]);
}

@end


//
//  Cell.m
//  DNA
//
//  Created by Max Lebedev on 04.11.12.
//  Copyright (c) 2012 mlebedev. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    
    if (self) {
        // инициализируем изменяемый массив из 100 элементов
        _dna = [[NSMutableArray alloc] initWithCapacity:100];
        
        // инициализируем массив, который будет хранить виды ДНК
        _kindsOfChar = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        
        // создаем переменную, в которой будут храниться случайные числа
        unsigned int randomValue;
        for (int i = 0; i<100; i++) {
            // получаем случаное число от 0 до  3, т.к. остаток от деления всегда меньше делителя
            randomValue = arc4random() % 4;
            // добавляем случайное число в массив
            [_dna addObject:[_kindsOfChar objectAtIndex:randomValue]];
        }
    }
    
    return  self;
}

-(int) hammingDistance:(Cell *)myCell2 {
    
    unsigned int count = 0;
    for (int i=0; i<100; i++) {
        if ([_dna objectAtIndex:i] != [[myCell2 dna] objectAtIndex:i]) {
            count++;
        }
    }
    
    return count;
}

@end

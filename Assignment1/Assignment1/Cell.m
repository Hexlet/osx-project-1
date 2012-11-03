//
//  Cell.m
//  Assignment1
//
//  Created by Alex Altabaev on 01.11.12.
//  Copyright (c) 2012 Alex Altabaev. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    letters = [[NSMutableArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    lenght = 99; // для тестирования очень удобно выставить например 9
    
    self = [super init];
    self->DNA = [[NSMutableArray alloc] init];
    for(int i = 0; i <= lenght; i++) {
        [self->DNA addObject:letters[arc4random()%4]]; // случайным образом генерируем значение индекса массива букв и 
    }                                                  // записываем в массив ДНК значение по этому индексу
    return self;
}

-(int) hammingDistance: (Cell *) c {
    int n = 0; // счетчик несовпадений
    for(int i = 0; i <= lenght; i++) {
        if(self->DNA[i] != c->DNA[i]) n++; // при не равенстве значений по одинаковым индексам увеличиваем счетчик
    }
    return n;
}

@end

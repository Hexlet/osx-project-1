//
//  Cell.m
//  DNA
//
//  Created by Vasiliy Shevchuk on 11/7/12.
//  Copyright (c) 2012 Vasiliy Shevchuk. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init {
    self = [super init];
    if (self) {
        _DNA_length = 100; // задаем значение длины DNA массива
        // инициализация
        _DNA = [[NSMutableArray alloc] initWithCapacity:_DNA_length];
        NSArray *variant = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];// варианты заполнения массива
        for (int i = 0 ; i < _DNA_length; i++) {
            int elem = arc4random()%4;     // случайный выбор заполнения
            [_DNA addObject:[NSString stringWithFormat:@"%@",variant[elem]]]; // добавляем случайно выбраный елемент
        }
    }
    return self;
}
-(int) hammingDistance: (Cell*)newDNA_Obj {
    int hammingdistance = 0;
    for (int i = 0;i < _DNA_length; i++){
        if (newDNA_Obj.DNA[i] != self.DNA[i]){ // сравниваем елементы массивов DNA
            hammingdistance++;        // если не совпадают
        }
    }
    return hammingdistance;
};
@end

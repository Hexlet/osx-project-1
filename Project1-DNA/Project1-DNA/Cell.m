//
//  Cell.m
//  Project1-DNA
//
//  Created by Nick Wishnyakov on 05.11.12.
//  Copyright (c) 2012 Nick Wishnyakov. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>

@implementation Cell

-(id)init
{
    self = [super init];
    if (self)
    {
        _DNA = [NSMutableArray arrayWithCapacity:100]; //создаем массив на 100 элементов
        _cellCollect = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil]; //создаем массив, элементами которого являются буквы
        //заполняем массив DNA случайными значениями
        for (int i = 0; i < 100; i++)
        {
            int rand_num = arc4random() % [_cellCollect count]; //берем случайный индекс
            [_DNA insertObject: [_cellCollect objectAtIndex:rand_num] atIndex: i]; //вставляем элемент массива с придуманым индексом на i-ое место
        }
    }
    return self;
}

-(int)hammingDistance:(Cell *)otherCell
{
    int hamming_distance = 0;
    //посимвольно сравниваем 2 массива
    for (int i = 0; i < 100; i++)
    {
        if ([self.DNA objectAtIndex:i] != [otherCell.DNA objectAtIndex:i])
        {
            hamming_distance++; //если символы различны увеличиваем hamming_distance
        }
    }
    //возвращаем количество позиций, на которых символы не совпадают
    return hamming_distance;
}

@end

//
//  Cell.m
//  MyDnk
//
//  Created by Михаил Субботин on 03.11.12.
//  Copyright (c) 2012 Михаил Субботин. All rights reserved.
//

#import "Cell.h"

@implementation Cell
static int const DNALenght = 100;

-(id) init {
    self = [super init];
    if(self){
        _DNA = [[NSMutableArray alloc] init]; // создаем массив
        for (int i = 0 ; i < DNALenght; i++) {
            [_DNA addObject:[NSString stringWithFormat:@"%@",[self generateElement]]]; // создаем элементы и заполняем массив
        }
        //NSLog(@"%@", _DNA);

    }
    return self;
}

-(int) hammingDistance:(Cell *)cell{
    if ([_DNA count] == [cell.DNA count]) // проверяем совпадение длинн обеих последовательностей;
    {
        int count = 0; // объявляем счетчик несовпадений
        for (int i=0; i < DNALenght; i++)
        {
            if ([_DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i]) //проверяем совпадают ли элементы массивов;
                count++;  // увеличиваем на 1 если не совпадают;
        }
        return count; // возвращаем количество несовпадений;
    }
    return -1; // возвращаем -1 так как длины массивов не совпадают
}

-(NSString*) generateElement{
    int number = rand()%4;
    NSString *str;
    switch (number) // в зависимости от числа выбираем символ;
    {
        //A, T, G и С
        case 0:
            str = @"A";
        break;
        case 1:
            str = @"T";
        break;
        case 2:
            str = @"G";
        break;
        case 3:
            str = @"C";
        break;
    }
    return str;
}
@end

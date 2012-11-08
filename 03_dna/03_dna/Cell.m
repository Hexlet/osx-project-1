//
//  Cell.m
//  03_dna
//
//  Created by Stas on 11/2/12.
//  Copyright (c) 2012 Stas. All rights reserved.
//

#import "Cell.h"

const int LENGTH_ARRAY = 100;                       //
const NSString *ch[4] = {@"A", @"T", @"G", @"C"};   //

@implementation Cell
// метод инициализации ////////////////////////////////////////////////////////////
-(id) init{
    self = [super init];
    if (self) {
        dna = [[NSMutableArray alloc] init];
        int count = LENGTH_ARRAY;
        while (count--)
            [dna addObject:ch[arc4random()%4]];
    }
    return self;
}
// метод инициализации закончен ///////////////////////////////////////////////////


// метод сравнения двух массивов, результатом которого является кол-во неодинаковых элементов с одинаковыми индексами hammingDistance
-(int) hammingDistance: (Cell*) cell{   // подсмотрел у кого-то ...(Cell*) cell (не понимаю пока такую конструкцию)
    int k = 0;                          // вводим и устанавливаем в ноль переменную, отвечающую за кол-во неодинаковых пар
    int count = LENGTH_ARRAY;           // вводим переменную-счетчик count, инициализировав ее размером массива
    while (count--)                     // цикл перебора всех эл-тов массива
        if ([dna objectAtIndex:count] != [cell->dna objectAtIndex:count])   // сравнение (не понимаю зачем (->dna), но компилятор нуждается)
            k++;                        // инкрементация кол-ва
    return k;                           // возврат в вызываемую функцию кол-ва неодинаковых пар
}
// метод сравнения двух массивов hammingDistance закончен /////////////////////////


// метод print (для наглядности) //////////////////////////////////////////////////
-(void) print{
    NSLog(@"%@", [dna componentsJoinedByString:@""]);
}
// метод print закончен ///////////////////////////////////////////////////////////
@end
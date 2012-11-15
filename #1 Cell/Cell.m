//
//  Cell.m
//  #1 Cell
//
//  Created by evlogii on 11/6/12.
//  Copyright (c) 2012 evlogii. All rights reserved.
//

#import <stdlib.h>
#import "Cell.h"

@implementation Cell {
    NSMutableArray* DNA;
}

- (id) init { // перегрузка инита (обарти внимание, что нет прототипа в определении класса)
    self = [super init]; // выполняем инит для НСОбджект
    if (self) { // если всё в порядке, то...
        DNA = [[NSMutableArray alloc] init]; // инициализация ДНК как мьютабл массива
        for (int i = 0; i < 100; i++) { // заполнение 100 ячеек объектами
            NSString *arrayString = @"ATGC";
            [DNA addObject:[NSString stringWithFormat:@"%c",[arrayString characterAtIndex:arc4random()%4]]]; // класса NSString с рандомными буквами
        }
    }
    return self; // возвращаем объект типа Целл
}

- (void) printDna { //вывод, тут всё просто
    for (int i=0; i<100; i++) {
        NSLog(@"%@",[DNA objectAtIndex:i]);
    };
}

- (int) getHammingDistance: (Cell *) cell { //получить дистанцию хамминга
    int count = 0;
    for (int i=0; i<100; i++) {
        if ([self->DNA objectAtIndex:i]!=[cell->DNA objectAtIndex:i]) count++;
        };
    return count;
}
@end

@implementation Cell (mutator)
    -(void) mutate:(int)degree{ // эта функция меняет рандомные дигри процентов
        if ((degree<=100)&&(degree>0)){ //если процент изменения в нормальных прежелах то меняем
            bool a[100];
            for (int i = 0; i<100; i++) a[i] = false; //в массиве храним инфу о изменённых объектах
            int i=0;
            while (i<degree) {
                int index = arc4random()%100;
                if (a[index]==0){ // если не меняли то рандомно меняем
                    NSString *arrayString = @"ATGC";
                    [DNA replaceObjectAtIndex:index withObject:[NSString stringWithFormat:@"%c",[arrayString characterAtIndex:arc4random()%4]]];
                    i++;
                    a[index]=1;
                }
            }
        }
        else printf("I can't change\n");
        
    }
@end
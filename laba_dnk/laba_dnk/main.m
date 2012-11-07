//
//  main.m
//  laba_dnk
//
//  Created by Smallkot on 31.10.12.
//  Copyright (c) 2012 Smallkot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

// категория mutator класса Cell
@interface Cell (mutator)
// метод объекта mutate
-(void)mutate:(int) X;
@end

@implementation Cell(mutator)
// метод объекта mutate примимает процент изменений значение должно быть от 0 до 100
// если будет меньше нуля, то метод ничего делать не будет, а если > 100, то изменит содержимое каждой яцейки
-(void)mutate:(int) X{
    // передали значение меньше нуля, ничего не делать
    if (X <= 0) {
        return;
    }else if (X > 100){ // значение больше 100, изменяем всю цепочку днк
        for (int i=0; i<100; ++i) {
            [DNK replaceObjectAtIndex:i withObject:self.getElementArray];
        }
    }else{ // иначе именяем в случайном прорядке ячейки днк, случайными значениями
        NSMutableArray *aTemp; // временный массив в котором будет хравиться индексы ячеек которые мы изменили
        aTemp = [NSMutableArray arrayWithCapacity:X]; // выделяем память на Х ячеек
        for (int i=0; i<X; ++i) { // бежим по массиву от 0 до Х
            BOOL aCheck = false; // переменная нужна для проверки
            do { // если истина, то продолжаем работу цикл
                aCheck = false;
                int newElement = arc4random() % 100; // выбираем случайную ячейку ДНК для изменения ее значения
                NSString *str = [NSString stringWithFormat:@"%d",newElement];
                if ([aTemp containsObject:str] == true){ // проверяем меняли ли в ДНК ячейку с таким индексом, если да, то цикл продолжает работу
                    aCheck = true;
                }
                if (!aCheck) { // иначе добавляем индекс в массив для индексов, чтобы повторно не изменять там значение
                    [aTemp addObject:str]; // добавляем индекс в массив
                    [DNK replaceObjectAtIndex:newElement withObject:[self getElementNext:[DNK objectAtIndex:newElement]]]; // меняем значение ДНК в случайном индексе
                }
            }while (aCheck);
        }
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // объявили два объекта класса Cell
        Cell *cell1, *cell2;
        // проинцилизируем эти объекты
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        // выведем результаты создания днк
        NSLog(@"Объект cell1:");
        [cell1 print];
        NSLog(@"Объект cell2:");
        [cell2 print];
        // сравним днк и выведем сколько позиций не совпадает
        int distance = [cell1 hammingDistance:cell2];
        NSLog(@"distance = %d", distance);
        // мутируем днка объектов
        [cell1 mutate:0];
        [cell2 mutate:100];
        // выведем мутируемые днк
        NSLog(@"Объект cell1:");
        [cell1 print];
        NSLog(@"Объект cell2:");
        [cell2 print];
        // сравним мутированые днк и выведем результаты
        distance = [cell1 hammingDistance:cell2];
        NSLog(@"distance = %d", distance);
    }
    return 0;
}


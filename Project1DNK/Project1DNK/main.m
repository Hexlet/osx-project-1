//
//  main.m
//  Project1DNK
//
//  Created by Sergey on 02.11.12.
//  Copyright (c) 2012 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator) // это интерфейс категории mutator класса Cell
-(void)mutate:(int) x; // определяем метод mutate, который возвращает void и принимает int.
@end

@implementation Cell (mutator) // это реализация категории mutator класса Cell
-(void) mutate:(int)x { // реализуем метод mutate, который возвращает void и принимает int.
    NSMutableArray* mutateCell = [[NSMutableArray alloc] init]; // создаем массив где будем запоминать какие ячейки уже мутировали, чтобы не муттировать их повторно
    NSNumber* num = [NSNumber alloc]; // создаем объект NSNumber
    int num_int, num_int2; // создаем 2 переменные типа int
    for (int i=1; i<=x; i++) { // создаем цикл от 1 до x процентов (в массиве у нас 100 элементов)
        num_int = arc4random() % 100; // получаем случайное число от 0 до 99 - это ячейка которую будем мутировать
        while ([mutateCell containsObject:[num initWithInt:num_int]]==YES) { // проверяем мутировали мы эту ячейку ранее или нет
//           NSLog(@"уже менялась ячейка %i",num_int);
           num_int = arc4random() % 100; // ячйка менялась поэтому получаем другое случайное число от 0 до 99 - это ячейка которую будем мутировать
        }
        // в nut_int у нас номер ячейки которую будем мутировать и ранее мы ее не мутировали
        [mutateCell addObject:[num initWithInt:num_int]]; // запоминваем номер ячейки в массиве mutateCell, чтобы не мутировать ячейку повторно.
 //       NSLog(@"меняем %i раз, ячейку %i",i,num_int);
        num_int2 = arc4random() % 4; // получаем число от 0 до 3 это что мы будем мутировать ячейку
        while ([[self.DNA objectAtIndex:num_int] isEqualToString:[arrayATGC objectAtIndex:num_int2]] == YES)  { // проверяем чтобы значение на которое будет мутировать ячейка отличалась от значения которое есть в ячейке.
   //       NSLog(@"совпало в ячейке %i",num_int2);
          num_int2 = arc4random() % 4; // значение совпало, поэтому полчаем следующее случайное число число от 0 до 3 это что мы будем мутировать ячейку
        }
        [self.DNA replaceObjectAtIndex:num_int withObject:[arrayATGC objectAtIndex:num_int2]]; // выполняем замену в ячейке num_int на значение из массива arrayATGC в ячейке num_int2
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell* myCell = [[Cell alloc] init]; // создаем 1 экземпляр класса  Cell
        Cell* myCell2 = [[Cell alloc] init]; // создаем 1 экземпляр класса  Cell
        NSLog(@"До mutate:%d", [myCell hammingDistance:myCell2]); // сравниваем ДНК 1 класса Cell с ДНК 2 класса Cell, выводим в консоль количество позиций где символы ДНК не совпадают
        [myCell mutate:10]; // мутируем ДНК класса Cell 1, процент мутаций 10%
        [myCell2 mutate:12]; // мутируем ДНК класса Cell 2, процент мутаций 12%
        NSLog(@"После mutate:%d", [myCell hammingDistance:myCell2]); // сравниваем ДНК 1 класса Cell с ДНК 2 класса Cell, после мутации и выводим в консоль количество позиций где символы ДНК не совпадают
    }
    return 0;
}


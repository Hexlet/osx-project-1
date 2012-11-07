//
//  main.m
//  DNKcompare
//
//  Created by VladIslav Khazov on 07.11.12.
//  Copyright (c) 2012 VladIslav Khazov. All rights reserved.
//

#import <Foundation/Foundation.h>
// Подключаем наш класс
#import "Cell.h"

//Создаем категорию mutator
@interface Cell (mutator)

-(void) mutate:(int) i;
@end

@implementation Cell (mutator)

-(void) mutate:(int) i{
    if (i<1 || i>100) {
        NSLog(@"Указан не верный параметр 'Процента мутации' ");
        return;
    }
    //Создадим массив для хранения уже мутировавших
    NSMutableArray *arrayCheck = [[NSMutableArray alloc] initWithCapacity:100];
    //Создаем временный массив видов ДНК
    NSArray *arrayCode = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    // Переменная для случайного номера ДНК
    int dnaIndex = 0;
    
    //Цикл от 1 до i процентов
    for (int j=1; j<=i; j++) {
        //Генерим случайное число от 0 до 99
        dnaIndex = arc4random()%100;
        //Если такой номер мы еще не изменяли - меняем, иначе повторяем проход.
        if ([arrayCheck containsObject:[[NSNumber alloc] initWithInt:dnaIndex]]) {
            // Уменьшаем счетчик
            j--;
        } else {
            // Записываем номер в массив? чтоб больше не использовать
            [arrayCheck addObject:[[NSNumber alloc] initWithInt:dnaIndex]];
            //Меняем
            [[self DNA] replaceObjectAtIndex:dnaIndex withObject:[arrayCode objectAtIndex:arc4random()%4]];
        }
    }
}
@end

//Основной код
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Cell *myCell = [[Cell alloc] init];
        Cell *otherCell = [[Cell alloc] init];
        //Делаем сравнение двух ДНК
        int i= [myCell hammingDistance:otherCell];
        NSLog(@"Разница ДНК: %i",i);
        // Меняем X% ДНК
        int procent = arc4random()%100+1;
        [myCell mutate:procent];
        [otherCell mutate:procent];
        //Делаем сравнение двух ДНК
        i= [myCell hammingDistance:otherCell];
        NSLog(@"Разница ДНК после мутации: %i",i);
        
    }
    return 0;
}


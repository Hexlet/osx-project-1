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
        NSLog(@"Указан не верный параметр 'Процента мутации'. Обе ДНК остались без изменений ");
        return;
    }
    // Количество элементов которые необходимо изменить в ДНК
    int countMutator = sizeDNA*i/100;
    //Создадим массив для хранения еще не мутировавших
    NSMutableArray *arrayCheck = [[NSMutableArray alloc] initWithCapacity:sizeDNA];
    for (int k=0; k<sizeDNA; k++) {
        [arrayCheck addObject:[NSNumber numberWithInt:k]];
    }
    //Создаем временный массив видов ДНК
    NSArray *arrayCode = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    // Переменная для случайного номера ДНК
    int dnaIndex = 0;
    
    //Цикл по нужному количество изменяемых элементов
    for (int j=1; j<=countMutator; j++) {
        //Генерим случайное число от 0 до количества еще не мутировавших элементов
        dnaIndex = arc4random_uniform(countMutator-j+1);
        //Меняем
        [[self DNA] replaceObjectAtIndex:dnaIndex withObject:[arrayCode objectAtIndex:arc4random_uniform(4)]];
        // Удаляем мутировавший элемент из архива
        [arrayCheck removeObjectAtIndex:dnaIndex];
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
        int procent = arc4random_uniform(100)+1;
        [myCell mutate:procent];
        [otherCell mutate:procent];
        //Делаем сравнение двух ДНК
        i= [myCell hammingDistance:otherCell];
        NSLog(@"Разница ДНК после мутации: %i",i);
        //тест
        //for (int i=0; i<sizeDNA; i++) {
        //    NSLog(@"#%i : %@ : %@",i,[[myCell DNA] objectAtIndex:i],[[otherCell DNA] objectAtIndex:i]);
        //}
        
    }
    return 0;
}


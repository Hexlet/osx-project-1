//
//  main.m
//  dna
//
//  Created by Администратор on 11/3/12.
//  Copyright (c) 2012 RightWay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

//Создание Категории mutator
@interface Cell (mutator)
    -(void) mutate:(int) persent;
@end

@implementation Cell (mutator)

-(void) mutate:(int)persent {
    //Если надо заменить все 100 процентов, то не меняем все значения
    if (persent == 100) {
        for (int i =0; i < 100; i++) {
            NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects: @"T", @"G", @"C", @"A", nil];
            NSString *current = [[NSString alloc] init];
            current = self.DNA[i];
            [arr removeObject:current];
            int index = arc4random() % 3;
            [self changeOneDNA:[[NSNumber alloc ] initWithInt:i] by:[arr objectAtIndex:index ]];
        }
    } else { //Если надо поменять меньше 100 процентов то выбираем случайным образом
        // массив для индексов уже заененных значений
        NSMutableArray *uniq = [[NSMutableArray alloc] init];
        NSNumber *randomIndex = [[NSNumber alloc] init];
        //генерируем случайным образом индекс для замены с проверкой на присутствие в массиве uniq
        for (int i =0; i < persent; i++) {
            do {
                int random = arc4random()%100;
                randomIndex = [[NSNumber alloc] initWithInt:random];
                
            } while ([uniq containsObject: randomIndex]);
            [uniq addObject:randomIndex];
            //Создаем массив всех возможных значений и убираем из него значение которое надо заменить
            NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects: @"T", @"G", @"C", @"A", nil];
            NSString *current = [[NSString alloc] init];
            current = [self.DNA objectAtIndex:[randomIndex intValue]];
            [arr removeObject:current];
            //выбираем случайным образом из оставшиххся символов один и заменяем им старое значение
            int index = arc4random() % 3;
            [self changeOneDNA:randomIndex by:[arr objectAtIndex:index ]];
        }
    }
    
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //Значение для метода mutate
        int x = 55;
        //Создаем два объекта класса
        Cell *firstDNA = Cell.rise, *secondDNA = Cell.rise;
        //Выводим результат функции hammingDistance
        NSLog(@"%i", [firstDNA hammingDistance:secondDNA]);
        //Запускаем метод mutate с параметром x
        [firstDNA mutate:x];
        //Выводим результат функции hammingDistance после работы метода mutate
        NSLog(@"%i", [firstDNA hammingDistance:secondDNA]);
    }
    return 0;
}


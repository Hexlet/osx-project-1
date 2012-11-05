//
//  main.m
//  DNA
//
//  Created by Georgiy Mostolovitsa on 31.10.12.
//  Copyright (c) 2012 Georgiy Mostolovitsa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
- (void)mutate:(int)percent;
- (void)mutateWith:(int)percent;
@end

@implementation Cell (mutator)

// Мутирует ДНК на переданное количество процентов
- (void)mutate:(int)percent {

    // Значение процента не может быть отрицательным
    if (percent < 0) {
        percent = 0;
    }

    // И не может быть больше 100
    if (percent > 100) {
        percent = 100;
    }

    int dnaCount = (int)[DNA count];                        // Кешируем общее количество элементов
    int mutateCount = (double)percent / dnaCount * 100;     // Считаем, сколько элементов необходимо заменить

    // «Случайный массив» — массив для хранения случайных, неповторяющихся чисел
    NSMutableArray *randomNumbers = [[NSMutableArray alloc] init];

    // Пока массив не заполнен до нужного количества
    while (randomNumbers.count < mutateCount) {

        // Генерим случайное число которое должно быть от 0 до DNS.count - 1
        NSNumber *random = [NSNumber numberWithInt:arc4random() % dnaCount];

        // Если полученное число уже есть — повторяем попытку
        if ([randomNumbers containsObject:random]) continue;

        // Добавляем полученное число в список
        [randomNumbers addObject:random];

        // И заменяем нуклеотид по индексу
        [self replaceAtIndex:[random intValue] withObject:[self getRandomNucleotide]];

    }

}

// Синоним для mutate:
- (void)mutateWith:(int)percent {
    [self mutate:percent];
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] initWithCapacity:100];  // Вот так ещё можно

        NSLog(@"%d", [cell1 hammingDistance:cell2]);

        [cell1 mutate:34];
        [cell2 mutateWith:67];                              // И вот так ещё

        NSLog(@"%d", [cell1 hammingDistance:cell2]);


    }
    return 0;
}

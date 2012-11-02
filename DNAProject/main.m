//
//  main.m
//  DNAProject
//
//  Created by S.Lebedev on 30.10.12.
//  Copyright (c) 2012 S.Lebedev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator) // категория Mutator класса Cell
-(void)mutate:(int)x; // для изменения х% последовательности
@end

@implementation Cell (Mutator) // имплементация категории Mutator
-(void)mutate:(int)x{
    NSCAssert((x>0&&x<=100), @"Invalid x value for mutating!"); // если неверно задан процент изменения, дальнейшие действия бессмысленны
    NSMutableArray *indexes = [[NSMutableArray alloc] initWithCapacity:capacityOfDNA]; // здесь будем хранить индексы
    NSUInteger randomKey = 0; //случайный ключ индекса заменяемого символа
    NSUInteger amount = lroundf((capacityOfDNA*x)/100.0f); // кол-во символов для изменения (x - процентный показатель)
    id sourceGene,modifiedGene; //переменные для анализа исходного символа и модифицированного символа
    for (int i=0; i<capacityOfDNA; i++) {
        [indexes addObject:[NSNumber numberWithInt:i]];
    }
    for (int modified=0;modified<amount;modified++) {
        // сначала сформируем случайным образом индекс, по которому будем обращаться
        // немаловажное условие - чтобы элемент по одному индексу менялся ровно один раз
        randomKey = arc4random() % [indexes count]; // формируем ключ
        NSUInteger indexToModify = [[indexes objectAtIndex:randomKey] integerValue]; // запоминаем индекс, чтобы по десять раз не посылать сообщения
        sourceGene = [[self DNA] objectAtIndex:indexToModify]; // запоминаем исходное значение в последовательности по индексу
        // и меняем значение символа, помня о том, что оно в любом случае должно отличаться от исходного!
        do {
            modifiedGene = [self getRandomGene];
        } while ([sourceGene isEqualToString:modifiedGene]);
        [DNA replaceObjectAtIndex:indexToModify withObject:modifiedGene]; // всё хорошо, есть новый символ!
        [indexes removeObjectAtIndex:randomKey]; // не забываем исключить использованный индекс
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Формируем первую последовательность ДНК");
        Cell *myCell = [[Cell alloc] init]; // первая ДНК
        NSLog(@"%@",myCell);
        NSLog(@"Сформировано");
        NSLog(@"Формируем вторую последовательность ДНК");
        Cell *myCell2 = [[Cell alloc] init]; // вторая ДНК
        NSLog(@"%@",myCell2);
        NSLog(@"Сформировано");
        NSLog(@"Hamming distance: %d",[myCell hammingDistance:myCell2]);
        // модифицируем обе ДНК
        NSLog(@"Модифицируем первую последовательность");
        [myCell mutate:100];
        NSLog(@"%@",myCell);
        NSLog(@"done");
        NSLog(@"Модифицируем вторую последовательность");
        [myCell2 mutate:100];
        NSLog(@"%@",myCell2);
        NSLog(@"done");
        NSLog(@"Hamming distance: %d",[myCell hammingDistance:myCell2]);
        
    }
    return 0;
}


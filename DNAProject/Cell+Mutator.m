//
//  Cell+Mutator.m
//  DNAProject
//
//  Created by S.Lebedev on 08.11.12.
//  Copyright (c) 2012 S.Lebedev. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator) // имплементация категории Mutator
-(void)mutate:(int)x{
    NSCAssert((x>=0&&x<=100), @"Invalid x value for mutating!"); // если неверно задан процент изменения, дальнейшие действия бессмысленны
    NSCAssert([DNA count]==capacityOfDNA, @"DNA integrity fail"); // проверка излишняя, но я параноик =)
    // если процент - ноль, то делать что-то тоже бессмысленно.
    if (x) {
        if (x==100) { // если менять всю последовательность, то не вижу смысла "скакать" по случайным индексам
            for (int i=0; i<capacityOfDNA; [DNA replaceObjectAtIndex:i withObject:[[self class] getRandomGene:[DNA objectAtIndex:i]]],i++);
        } else {
            NSUInteger amount = lroundf((capacityOfDNA*x)/100.0f); // кол-во символов для изменения (x - процентный показатель)
            NSMutableArray *indexes = [[NSMutableArray alloc] initWithCapacity:capacityOfDNA]; // здесь будем хранить индексы
            NSUInteger randomKey = 0; //случайный ключ индекса заменяемого символа
            for (int i=0; i<capacityOfDNA; i++) {
                [indexes addObject:[NSNumber numberWithInt:i]];
            }
            for (int modified=0;modified<amount;modified++) {
                // сначала сформируем случайным образом индекс, по которому будем обращаться
                // немаловажное условие - чтобы элемент по одному индексу менялся ровно один раз
                randomKey = arc4random() % [indexes count]; // формируем ключ
                NSUInteger indexToModify = [[indexes objectAtIndex:randomKey] integerValue]; // запоминаем индекс, чтобы по десять раз не посылать сообщения
                [DNA replaceObjectAtIndex:indexToModify withObject:[[self class] getRandomGene:[DNA objectAtIndex:indexToModify]]]; // всё хорошо, есть новый символ!
                [indexes removeObjectAtIndex:randomKey]; // не забываем исключить использованный индекс
            }
        }
    }
}

@end

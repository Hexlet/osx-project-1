//
//  Cell+mutator.m
//  DNAHomework
//
//  Created by Евгений on 04.11.12.
//  Copyright (c) 2012 Jeck labs. All rights reserved.
//

#import "Cell+mutator.h"
#import <stdlib.h>

@implementation Cell (mutator)

- (void) mutate:(int) count {
    // Генерируем по массиву для каждого нуклеида содержащий три другие
    // для удобства последующей замены
    NSMutableArray *replacingValues;
    replacingValues = [NSMutableArray arrayWithCapacity:[nucleotides count]];
    
    int replacesCount;
    replacesCount = (int) [nucleotides count] - 1;
    for (int i = 0; i < [nucleotides count]; i++) {
        NSMutableArray *replacingValue;
        replacingValue = [NSMutableArray arrayWithCapacity: replacesCount];
        for (int j = 0; j < [nucleotides count]; j++) {
            // Проверяем не добавим ли мы ключевый нуклеид в список возможных замен
            if (i != j) {
                [replacingValue addObject:[nucleotides objectAtIndex: j]];
            }
        }
        [replacingValues addObject:replacingValue];
    }
    
    // Раз уж мы разобрались с NSMutableArray почему бы не разобратся со словарем
    // создаем словарь где в качестве ключа будет нуклеид а в значении массив
    // с тремя другими нуклеидами
    NSDictionary *replacingTable;
    replacingTable = [NSDictionary dictionaryWithObjects: replacingValues forKeys: nucleotides];
    
    
    // Это просто массив чисел от 1 до 100 (в данном случае) с помощью которого
    // мы будем выбирать случайную позицую в последовательности ДНК для замены
    NSMutableArray *range = [NSMutableArray array];
    int dnaCount = (int) [DNA count];
    for (int i = 0; i < dnaCount; i++) {
        // @(i) - какой то хитрый способ создания NSNumber
        [range addObject: @(i)];
    }
    
    // Собственно сам процес мутирования нуклеидов
    
    // Случайный индекс в последовательности range из генератора
    int randomIndex;
    // Значение из range указывающее на позицую для замены в DNA
    int dnaIndex;
    // Случайный нуклеид выбраный из таблицы замен для нуклеида из DNA
    NSString *replace;
    for (int i = 0; i < count; i++) {
        // Получаем ключ для замены
        randomIndex = arc4random_uniform((int) [range count]);
        dnaIndex = [[range objectAtIndex: randomIndex] intValue];
        // И удаляем его из range что бы не заменять одни и теже
        // нуклеиды дважды
        [range removeObjectAtIndex: randomIndex];
        // Для выбраного нуклеида из последовательности DNA выбираем случайный
        // индекс из таблицы замен
        replace = [[replacingTable objectForKey: [DNA objectAtIndex:dnaIndex]] objectAtIndex: arc4random_uniform(replacesCount)];
        // После чего меняем старый на новый
        [DNA replaceObjectAtIndex: dnaIndex withObject: replace];
    }
}

@end

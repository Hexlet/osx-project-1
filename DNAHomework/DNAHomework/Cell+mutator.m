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

- (void) mutate:(int) percent {
    
    if (percent <= 0 || percent > 100) {
        // Если percent = 0 то зачем делать работу
        // в остальных случаях возможно имеет смысл выкидывать исключение...
        return;
    }
    
    // Вычисляем точное число замен из процента
    int count = _count * percent / 100;
    
    int nucleotidesCount;
    nucleotidesCount = (int) [_nucleotides count];
    
    // Это просто массив чисел от 0 до _count с помощью которого
    // мы будем выбирать случайную позицую в последовательности ДНК для замены
    NSMutableArray *range = [NSMutableArray array];
    int dnaCount = (int) [_dna count];
    for (int i = 0; i < dnaCount; i++) {
        // @(i) - какой то хитрый способ создания NSNumber
        [range addObject: @(i)];
    }
    
    // Собственно сам процес мутирования нуклеидов
    
    // Случайный индекс в последовательности range из генератора
    int randomIndex;
    // Значение из range указывающее на позицую для замены в DNA
    int dnaIndex;
    int replaceIndex;
    for (int i = 0; i < count; i++) {
        // Получаем ключ для замены
        randomIndex = arc4random_uniform((int) [range count]);
        dnaIndex = [[range objectAtIndex: randomIndex] intValue];
        // И удаляем его из range что бы не заменять одни и теже
        // нуклеиды дважды
        [range removeObjectAtIndex: randomIndex];
        
        // Выбираем случайный индекс из _nucleotides за исключением текущего
        replaceIndex = (int) [_nucleotides indexOfObject: [_dna objectAtIndex: dnaIndex]];
        replaceIndex = (replaceIndex + 1 + arc4random_uniform(nucleotidesCount - 1)) % nucleotidesCount;
        [_dna replaceObjectAtIndex: dnaIndex withObject: [_nucleotides objectAtIndex: replaceIndex]];
    }
}

@end

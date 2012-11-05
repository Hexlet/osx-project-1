//
//  Cell+mutator.m
//  DNA project
//
//  Created by Sergey Starukhin on 02.11.12.
//  Copyright (c) 2012 Sergey Starukhin. All rights reserved.
//

#import "Cell+mutator.h"
#import "NSSet+Randomizer.h"

@interface Cell ()

@property (nonatomic, strong) NSMutableArray *dna;

// Метод возвращает множество элементов из которых строится ДНК
// в данном случае A,T,G,C
+ (NSSet *)possibleElements;

@end

@implementation Cell (mutator)

- (void)mutate:(int)percent {
    NSAssert((percent >= 0 && percent <= 100), @"Wrong percent count:%d",percent);
    NSNumber *randomNumber;
    // множество для хранения индексов мутированных элементов (чтобы не повторяться)
    NSMutableSet *alreadyMutatedElements = [[NSMutableSet alloc] init];
    // вычисляем количество элементов для мутации
    int numberOfElementsForMutation = percent * LENGTH_OF_DNA / 100;
    while (alreadyMutatedElements.count < numberOfElementsForMutation) {
        // генерация случайного числа с проверкой на уникальность
        do {
            randomNumber = [NSNumber numberWithInt:(rand() % LENGTH_OF_DNA)];
        } while ([alreadyMutatedElements containsObject:randomNumber]);
        // локальная изменяемая копия множества элементов из которых строится ДНК
        NSMutableSet *dnaComponents = [[Cell possibleElements] mutableCopy];
        //удаляем текущий элемент ДНК из локального множества элементов из которых строится ДНК
        [dnaComponents removeObject:[self.dna objectAtIndex:randomNumber.intValue]];
        // заменяем текущий элемент ДНК случайным элементом локального множества
        [self.dna replaceObjectAtIndex:randomNumber.intValue withObject:[dnaComponents randomObject]];
        [alreadyMutatedElements addObject:randomNumber];
    }
}

@end

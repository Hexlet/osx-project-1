//
//  Cell+mutator.m
//  DNA project
//
//  Created by Sergey Starukhin on 02.11.12.
//  Copyright (c) 2012 Sergey Starukhin. All rights reserved.
//

#import "Cell+mutator.h"

@interface Cell ()

@property (nonatomic, strong) NSMutableArray *dna;

+ (id)getRandomElement;

@end

@implementation Cell (mutator)

- (void)mutate:(int)percent {
    NSNumber *randomNumber;
    NSMutableSet *alreadyMutatedElements = [[NSMutableSet alloc] init];  // множество для хранения индексов мутированных элементов (чтобы не повторяться)
    int numberOfElementsForMutation = percent * kLengthOfDNA / 100; // вычисляем количество элементов для мутации
    while (alreadyMutatedElements.count < numberOfElementsForMutation) {
        // генерация случайного числа с проверкой на уникальность
        do {
            randomNumber = [NSNumber numberWithInt:(rand() % kLengthOfDNA)];
        } while ([alreadyMutatedElements containsObject:randomNumber]);
        [self.dna replaceObjectAtIndex:randomNumber.intValue withObject:[Cell getRandomElement]];
        [alreadyMutatedElements addObject:randomNumber];
    }
}

@end

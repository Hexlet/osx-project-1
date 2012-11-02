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

+ (NSSet *)possibleElements;

@end

@implementation Cell (mutator)

- (void)mutate:(int)percent {
    if (percent >= 0 && percent <= 100) {
        NSNumber *randomNumber;
        NSMutableSet *alreadyMutatedElements = [[NSMutableSet alloc] init];  // множество для хранения индексов мутированных элементов (чтобы не повторяться)
        int numberOfElementsForMutation = percent * kLengthOfDNA / 100; // вычисляем количество элементов для мутации
        while (alreadyMutatedElements.count < numberOfElementsForMutation) {
            // генерация случайного числа с проверкой на уникальность
            do {
                randomNumber = [NSNumber numberWithInt:(rand() % kLengthOfDNA)];
            } while ([alreadyMutatedElements containsObject:randomNumber]);
            NSMutableSet *dnaComponents = [[Cell possibleElements] mutableCopy]; // локальная изменяемая копия множества элементов ДНК
            [dnaComponents removeObject:[self.dna objectAtIndex:randomNumber.intValue]]; //удаляем текущий элемент из локального множества
            [self.dna replaceObjectAtIndex:randomNumber.intValue withObject:[dnaComponents randomObject]]; // заменяем текущий элемент ДНК случайным элементом локального множества
            [alreadyMutatedElements addObject:randomNumber];
        }
    } else {
        NSLog(@"Alarm! Mutation of DNA 146%%");
    }
}

@end

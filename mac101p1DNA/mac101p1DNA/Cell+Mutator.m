//
//  Cell+Mutator.m
//  mac101p1DNA
//
//  Created by Voleg on 06.11.12.
//  Copyright (c) 2012 Voleg. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate:(NSUInteger) x {
    // Использую NSIndexSet для генерации уникальных наборов индексов
    NSUInteger num = floor(self->DNA.count*x/100); // кол-во изменяемых молекул ДНК
    // получаем номера изменяемых молекул случайным образом
    NSIndexSet *molnum = [[NSIndexSet alloc] initWithIndexSet:[self generateRandomIndexes:num]];
    // Генерируем молекулы
    NSMutableArray *array = [[NSMutableArray alloc] init];
    array = [NSMutableArray arrayWithArray:[self makeDNA:num]];
    // Внедряем в DNA новые элементы по их интексам 
    [self->DNA replaceObjectsAtIndexes:molnum withObjects:array];
}

    // Генерируем последовательность уникальных индексов в нужном колличестве
-(NSIndexSet *) generateRandomIndexes:(NSUInteger) l {
    NSMutableIndexSet *places = [[NSMutableIndexSet alloc] init];
    NSUInteger number = 0;
    
    while (places.count < l) {
        number = arc4random()%self->DNA.count;
        [places addIndex:number];
    }
    return places;
}

@end

//
//  Cell+mutator.m
//  osx-project-1
//
//  Created by Maxim Zhukov on 05.11.12.
//  Copyright (c) 2012 Maxim Zhukov. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void) mutate:(int) withPercent {
    // проверка границ
    if (withPercent < 0) {
        withPercent = 0;
    }
    
    if (withPercent > 100) {
        withPercent = 100;
    }
    
    // вычисляю количество изменяемых молекул
    long int length = lroundf(self->DNA.count * withPercent / 100);
    
    // генерирую индексы меняемых молекул
    NSIndexSet *indexes = [[NSIndexSet alloc] initWithIndexSet:[self generateIndexes:length]];
    
    // мутирую гены по уникальным индексам
    [indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        [self->DNA replaceObjectAtIndex:idx withObject:[self getRandomMoleculeWithoutCurrent:[self->DNA objectAtIndex:idx]]];
    }];
}

-(NSIndexSet *) generateIndexes:(long int) withLength {
    NSMutableIndexSet *indexes = [[NSMutableIndexSet alloc] init];
    NSUInteger number = 0;
    
    // заполняю массив индексов уникальными значениями
    // т.к. NSMutableIndexSet содержит только уникальные значения
    // то заполняю, пока не заполнится нужным колличеством
    do {
        number = [self getRandomNumber:self->DNA.count];
        [indexes addIndex:number];
    } while (indexes.count<withLength);
    
    return indexes;
}

// случайным образом возвращаем одну из возможных молекул, за исключением текущей
-(NSString *) getRandomMoleculeWithoutCurrent:(id) mol {
    NSMutableArray *molecule = [NSMutableArray arrayWithObjects: @"A",@"T",@"G",@"C",nil];
    [molecule removeObject:mol];
    return [molecule objectAtIndex:[self getRandomNumber:[molecule count]]];
}

@end

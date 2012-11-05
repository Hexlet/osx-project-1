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
    // вычисляю количество изменяемых молекул
    long int length = lroundf(self->DNA.count * withPercent / 100);
    
    // генерирую индексы меняемых молекул
    NSIndexSet *indexes = [[NSIndexSet alloc] initWithIndexSet:[self generateIndexes:length]];
    // генерирую случайные молекулы
    NSMutableArray *array = [NSMutableArray arrayWithArray: [self generateDNA:length]];
    
    [self->DNA replaceObjectsAtIndexes:indexes withObjects:array];
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

@end

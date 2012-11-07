//
//  main.m
//  HexletCell
//
//  Created by Артем Прохоров on 06.11.12.
//  Copyright (c) 2012 Артем Прохоров. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate:(int)X;
@end

@implementation Cell (mutator)

// Мутирует X% ячеек DNA
-(void) mutate:(int)X {
    // Вычисляется сколько ячеек будет мутировано, согласно указанному проценту
    int numOfMarksForMutation = ((int)([self.DNA count] / 100)) * X;
    
    // Создается массив индексов элементов DNA из которого случайно будут браться индексы
    // для изменения значений массива DNA.
    // Это нужно для того, чтобы гарантированно не 'попадаться' на одни и те же индексы
    // при генерации случайных чисел и не 'топтаться на месте'
    NSMutableArray *listOfDNAIndexes = [NSMutableArray arrayWithCapacity:[self.DNA count]];
    for (int i = 0; i < [self.DNA count]; i++) {
        [listOfDNAIndexes addObject:[NSNumber numberWithInteger:i]];
    }
    for (int i = 0; i < numOfMarksForMutation; i++) {
        int randomIndex = arc4random() % [listOfDNAIndexes count];
        NSNumber *indexToMutateDNA = [listOfDNAIndexes objectAtIndex:randomIndex];
        [self.DNA replaceObjectAtIndex:[indexToMutateDNA integerValue] withObject:self.getRandomDNAMark];
        // 'Использованный' индекс выталкивается из массива индексов
        [listOfDNAIndexes removeObjectAtIndex:randomIndex];
    }
}
@end
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Humming distance: %d", [cell1 hammingDistance:cell2]);
        [cell1 mutate:50];
        [cell2 mutate:50];
        NSLog(@"Humming distance after mutation: %d", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


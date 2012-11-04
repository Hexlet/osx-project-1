//
//  Cell+Mutator.m
//  DNA
//
//  Created by MacUser on 03.11.12.
//  Copyright (c) 2012 MacUser. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)
-(void) mutate: (int) percentOfMutation {
    if (percentOfMutation>0 && percentOfMutation<101) {
        // Создаем вспомогательный массив, равный по размеру dna, где каждый элемент будет содержать
        // свой собственный индекс.
        // Получив очередной индекс для внесения изменений, мы будем менять значение dna по этому индексу
        // и удалять из вспомогательного массива элемент, содержащий значение этого индекса.
        // Таким образом вспомогательный массив будет уменьшаться в размере, оставляя внутри себя
        // только неизмененные элементы - мы сократим количество итераций ровно до percentOfMutation.
        
        // Создаем вспомогательный массив
        NSMutableArray *unchangedItemIndexes;
        int dnaCount = (int)[self.dna count];
        unchangedItemIndexes = [NSMutableArray arrayWithCapacity: dnaCount];
        // и заполняем его
        int idx;
        for (idx=0; idx<dnaCount; idx++) {
            [unchangedItemIndexes addObject: [NSNumber numberWithInt: idx]];
        }
        
        // 
        for (idx=1; idx<=percentOfMutation; idx++) {
            // Получаем очередной случайный элемент из числа неизмененных
            int unchangedItem = arc4random_uniform((int)[unchangedItemIndexes count] - 1);
            // и соответствующее ему значение индекса в dna
            int dnaIndexForChange = [[unchangedItemIndexes objectAtIndex: unchangedItem] intValue];
            
            // Получаем новое значение для dna элемента (отличное от имеющегося)
            NSString *currentCode;
            do {
                currentCode = [Cell getRandomCode];
            } while (currentCode == [self.dna objectAtIndex: dnaIndexForChange]);
            
            // иногда интересно посмотреть что и как мутировало
            // NSLog(@"  Changed %@ to %@ at Index %i (%i)", [self.dna objectAtIndex: dnaIndexForChange], currentCode, dnaIndexForChange, idx);
            
            // Устанавливаем новое значение элемента dna
            [self.dna replaceObjectAtIndex: dnaIndexForChange withObject: currentCode];
            // и удаляем текущий (измененный) элемент из вспомогательного массива
            [unchangedItemIndexes removeObjectAtIndex: unchangedItem];
        }
    }
}

@end

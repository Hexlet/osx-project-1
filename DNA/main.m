//
//  main.m
//  osx-project-1
//
//  Created by qqq qqq on 11/6/12.
//  Copyright (c) 2012 qqq qqq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
- (void) mutate:(int) percent;
@end

@implementation Cell (Mutator)

- (void) mutate:(int) percent {
    if (percent > 100) {
        percent = 100;
    }
    if (percent < 0) {
        percent = 0;
    }
    
    int number = CELL_SIZE / 100.0 * percent;
    NSMutableArray * indexes = [NSMutableArray arrayWithCapacity:number];
    
//    Заполняем массив последовательностью. Считаем что это индексы в массиве DNA.
//    Генерируем случайное число.
//    Берем из заполненого массива индекс для DNA по этому случайному числу
//    Удаляем из заполненого массива индекса DNA по сгенерированному случайному числу
    for (int i = 0; i < CELL_SIZE; i++) {
        [indexes addObject: [[NSNumber alloc] initWithInt:i]];
    }
    
    for (int i = 0; i < number; i++) {
//        Как правильно приводить типы?
        NSInteger randonNumber = arc4random_uniform([indexes count]);
        NSInteger index = [[indexes objectAtIndex:randonNumber] integerValue];
        NSString *new_value = [Cell generateCellValue];
        
        while([[self.DNA objectAtIndex:index] isEqualToString:new_value]) {
            new_value = [Cell generateCellValue];
        }
        
        [self.DNA replaceObjectAtIndex:index withObject:new_value];
        [indexes removeObjectAtIndex:randonNumber];
    }
}

@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell, *cellSubject;
        cell = [[Cell alloc] init];
        cellSubject = [[Cell alloc] init];
        
        NSLog(@"Hamming distance: %d", [cell hammingDistance:cellSubject]);
        
        [cell mutate:20];
        [cellSubject mutate:20];
        
        NSLog(@"Hamming distance: %d", [cell hammingDistance:cellSubject]);
    }
    return 0;
}


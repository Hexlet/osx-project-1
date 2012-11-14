//
//  main.m
//  DNA
//
//  Created by Alex Demchenko on 12.11.12.
//  Copyright (c) 2012 Alex Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

// описание категории Mutator класса Cell
@interface Cell (Mutator)

-(void)mutate:(int)mutator;

@end

// реализация
@implementation Cell (Mutator)

-(void)mutate:(int)mutator {
    // массив, контролирующий выбор строго разных ячеек
    NSMutableArray *controlArray = [[NSMutableArray alloc] init];
    for (int i=0; i<mutator; i++) {
        // выбираем случайное число от 0 до 99 (ячейка ДНК)
        int newCell = arc4random() % 100;
        
        // проверка: если использовалась одна из ячеек, она не будет использована второй раз
        if ([controlArray containsObject:[NSNumber numberWithInt:newCell]]) {
            newCell = arc4random() % 100;
        }
        [controlArray addObject:[NSNumber numberWithInt:newCell]];
        
        // генерация новых значений из множества {A, T, G, C}
        char newCharDNA = ' ';
        int newDNA = arc4random() % 4;
        if (newDNA == 0) {
            newCharDNA = 'A';
        } else if (newDNA == 1) {
            newCharDNA = 'T';
        } else if (newDNA == 2) {
            newCharDNA = 'G';
        } else if (newDNA == 3) {
            newCharDNA = 'C';
        }
        
        // замена значения случайно выбранной ячейки
        [self->DNA replaceObjectAtIndex:newCell withObject:[NSString stringWithFormat:@"%c", newCharDNA]];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell;
        Cell *anotherCell;
       
        cell = [[Cell alloc] init];
        anotherCell = [[Cell alloc] init];
        NSLog(@"%d",[cell hammingDistance:anotherCell]);
        
        // мутируем 37 произвольных ячеек первой клетки и 75 другой
        [cell mutate:37];
        [anotherCell mutate:75];
        NSLog(@"%d",[cell hammingDistance:anotherCell]);
    }
    
    return 0;
}


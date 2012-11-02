//
//  CellMutator.m
//  project1_DNA
//
//  Created by Alex on 11/2/12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import "CellMutator.h"
#import "Cell.h"

@implementation Cell(Mutator)

-(void) mutate: (int) percents {
    if(percents >= 0 && percents <= 100){  // проверяем на адекватность входной параметр
        int changeCount = CELL_CAPACITY * percents / 100;
        NSMutableArray *changePositions;
        changePositions = [[NSMutableArray alloc] initWithCapacity:changeCount];
        NSNumber *randPosition;
        NSString *randGen;
        NSUInteger index;
        
        while ([changePositions count] != changeCount) { //мутируем пока не поменяем нужное кол-во генов
            randPosition = [NSNumber numberWithInt:arc4random() % CELL_CAPACITY];  // рандомная позиция
            index = [changePositions indexOfObject: randPosition]; 
            
            if(index == NSNotFound){ // проверка что эту позицию еще не меняли
                [changePositions addObject:randPosition]; // добавляем в использованые
                
                do {
                    randGen = [geneticMaterial objectAtIndex: arc4random() % [geneticMaterial count]]; //выбираем ген
                } while ([randGen isEqual:[self.DNA objectAtIndex:[randPosition intValue]]]); // перегенериваем ген если он совпадает с тем что в клетке на этой позиции
                
                [self.DNA insertObject:randGen atIndex:[randPosition intValue]]; //заменяем ген
            }
        }
    } else {
        [NSException raise:@"Invalid percents value" format:@"percents must be from 0 to 100, %d entered", percents];
    }
}

@end

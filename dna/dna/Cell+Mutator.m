//
//  Cell+Mutator.m
//  dna
//
//  Created by Pavel Kravets on 06.11.12.
//  Copyright (c) 2012 Pavel Kravets. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate:(int)percent {
    //Проверка на правильность аргумента
    if (percent <= 0 || percent > 100){
        return;
    }
    //Абсолютное количество мутируемых позиций
    int mutatedCount = percent*[[self dnaArray] count]/100;
    //Массив уже измененных индексов (чтобы обеспечить строгое количество изменяемых позиций)
    NSMutableArray* mutatedIndexes = [[NSMutableArray alloc] init];
    int i=0;
    while (i < mutatedCount){
        //Случайно выбираем индекс мутируемой позиции
        int mutatedIndex = arc4random() % [[self dnaArray] count];
        //Проверка не изменяли ли уже эту позицию
        if (![mutatedIndexes containsObject: [NSNumber numberWithInt: mutatedIndex]]) {
            [mutatedIndexes addObject: [NSNumber numberWithInt: mutatedIndex]];
            //Старое значение
            NSString* oldValue = [[self dnaArray] objectAtIndex: mutatedIndex];
            //Новое значение
            NSString* newValue = [NSString stringWithFormat: @"%c", [ATGC characterAtIndex: arc4random() % [ATGC length]]];
            //Новое значние не может совпадать со старым
            while (oldValue==newValue){
                newValue = [NSString stringWithFormat: @"%c", [ATGC characterAtIndex: arc4random() % [ATGC length]]];
            }
            //Заменяем нужную позицию
            [[self dnaArray] replaceObjectAtIndex: mutatedIndex withObject: newValue];
            i++;
        }
        else {
            continue;
        }
    }

}

@end

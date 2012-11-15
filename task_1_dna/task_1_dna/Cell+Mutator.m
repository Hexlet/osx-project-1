//
//  Cell+Mutator.m
//  task_1_dna
//
//  Created by Sergey Sh on 07.11.12.
//  Copyright (c) 2012 Sergey Sh. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate:(int) x {
    int countOfMutation;
    int numberOf;
    
    NSMutableArray *mutationIndex;
    
    countOfMutation = (int) (self.count * x) / 100;
    NSLog(@"countOfMutation = %i", countOfMutation);
    
    mutationIndex = [[NSMutableArray alloc] init];
    
    
    // подготовка индексов массива мутаций

    for (int i = 0; i < countOfMutation; i++) {
        // ниже генерируем случайное целое с верхней границей, определяемой старшим номером
        // массива генов
        // если сгенерированного номера еще нет в кандидатах на будущую мутацию
        // то заносим его в массив, который будет содержит индексы промутированных генов
        do {
            numberOf = (random() % (self.count - 1));
        } while ([mutationIndex containsObject:[NSNumber numberWithInt: numberOf]]);
        
        // тут заносим
        // надо понимать, что этот массив я держу только для того, чтобы помнить все промутировавшие
        // гены (точнее их индексы)
        [mutationIndex addObject: [NSNumber numberWithInt: numberOf]];
        
        NSLog(@"mutation Index = %i", numberOf);
        
        // заменяем ген с индексом на его мутацию (мутация может оказаться такой же, как и было значение гена до нее)
        // то есть - я не смотрю на то, каким был ген до мутации и после нее
        // важен сам факт того, что ген с номером "numberOf" будет заменен на что то другое
        // хотя то другое может оказаться и идентичным ранее
        
        [[self DNA] replaceObjectAtIndex: numberOf withObject: [self getUnit]];
    }
  
}

@end
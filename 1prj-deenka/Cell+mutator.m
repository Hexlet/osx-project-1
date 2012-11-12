//
//  Cell+mutator.m
//  1prj-deenka
//
//  Created by Wladi on 06.11.12.
//  Copyright (c) 2012 noorg. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

/*
 
    Линейная имплементация мутации (не как в задании - замена ячеек в случайном порядке)
 
*/

- (void) mutator: (int) percent {

    // сюда будем записывать значение звена-мутанта
    NSString *mutant;
    // а сюда новое значение звена-мутанта
    unichar aberrare;
    
  
    // фактическое кол-во мутировавших звеньев
    // хотя для исходного условия (100 звеньeв) этот шаг избыточен,
    // а для значений < 100 нужно вводить специальную обработку малых значений процентов  
    unsigned int mutants = (unsigned int)([DNA count]*percent)/100;
    
    for (i=0; i<mutants; i++){

        // DNA возвращает NSString
        mutant=[DNA objectAtIndex:i];

        // ищем значение мутации, отличное от текущего значения
        do aberrare=[DNA_bases characterAtIndex:(unsigned int) arc4random()%4];
        while ([mutant characterAtIndex:0] == aberrare); // достаем первый и единственный символ из строки mutant и сравниваем

        // собственно мутация текущего звена
        [DNA replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%c",aberrare]];
        
    }
}

@end

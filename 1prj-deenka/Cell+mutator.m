//
//  Cell+mutator.m
//  1prj-deenka
//
//  Created by Wladi on 06.11.12.
//  Copyright (c) 2012 noorg. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)


- (void) mutator: (int) percent {

/************* DEFINE & INIT VARIABLES ****************************/
    
    // индекс случайной ячейки - мутанта
//    NSInteger j;

    // вектор индексов для ДНК
    NSMutableArray *indexDNA;
    indexDNA = [[NSMutableArray alloc] initWithCapacity:100];
    // заполняем значениями от 0 до 99
    for (i=0; i<100; i++) [indexDNA addObject:[NSNumber numberWithInteger:i]];
    
    //    NSLog(@"indexDNA at 87: @@", indexDNA[87]);
    
    // сюда будем записывать значение звена-мутанта
    NSString *mutant;
    // а сюда новое значение звена-мутанта
    unichar aberrare;
    
  
    // фактическое кол-во мутировавших звеньев
    // хотя для исходного условия (100 звеньeв) этот шаг избыточен,
    // а для кол-ва  звеньев < 100 нужно вводить специальную обработку малых значений процентов
    // проверку самого значения % тоже опустим, поскольку нет ввода пользователя
    unsigned int mutants = (unsigned int)([DNA count]*percent)/100;
 
    
/******** END OF DEFINE & INIT VARIABLES ****************************/    
    
    // подготовка вектора - создание индекса мутаций
    for (i=0; i<mutants; i++){

        // случайная ячейка 0-99
        do j=(unsigned int) arc4random()%100;
        // рандомим, пока не найдем непомеченную (co значениме NO)
        while (indexDNA[j] == YES);
        
        // пометить для мутации
        indexDNA[j] = YES;
    }
    
    // мутации по "списку" из индекса
    // перебираем весь индексный вектор
    for (j=0; j<100; j++){

        // для каждой помеченной для мутации ячейки
        if (indexDNA[j] == YES) {

        // DNA возвращает NSString
        mutant=[DNA objectAtIndex:j];

        // ищем значение мутации, отличное от текущего значения
        do aberrare=[DNA_bases characterAtIndex:(unsigned int) arc4random()%4];
        while ([mutant characterAtIndex:0] == aberrare); // достаем первый и единственный символ из строки mutant и сравниваем

        // собственно мутация текущего звена/ячейки
        [DNA replaceObjectAtIndex:j withObject:[NSString stringWithFormat:@"%c",aberrare]];
        }
    }
}

@end

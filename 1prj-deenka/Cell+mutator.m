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
    
    // индекс и значение случайной ячейки - мутанта
    NSInteger m,k;
    NSString *j; // для преобразования string2int

    // вектор индексов для ДНК (список доступных ячеек)
    NSMutableArray *indexDNA;
    indexDNA = [[NSMutableArray alloc] initWithCapacity:100];
    // заполняем значениями от 0 до 99
    for (i=0; i<100; i++) [indexDNA addObject:[NSNumber numberWithInteger:i]];
    
//    NSLog(@"indexDNA at 87: %@", [indexDNA objectAtIndex:87]);
    
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
    

    
    // крутим mutants раз
    // из индексного вектора каждый раз будет выбираться случайный индекс для мутации
    // и после мутации удаляться из списка "доступных"
    for (i=0; i<mutants; i++){

        // случайная индексная ячейка
        k=arc4random()%[indexDNA count];
        // считываем и преобразовываем индекс
        j=[indexDNA objectAtIndex:(unsigned int) k];
        m=[j integerValue];

        // DNA возвращает NSString
        mutant=[DNA objectAtIndex:m];

        // ищем значение мутации, отличное от текущего значения
        do aberrare=[DNA_bases characterAtIndex:(unsigned int) arc4random()%4];
        while ([mutant characterAtIndex:0] == aberrare); // достаем первый и единственный символ из строки mutant и сравниваем

        // собственно мутация текущего звена/ячейки
        [DNA replaceObjectAtIndex:m withObject:[NSString stringWithFormat:@"%c",aberrare]];
        
        // убиваем использованный индекс
        [indexDNA removeObjectAtIndex:(unsigned int) k];
    
    }
}

@end

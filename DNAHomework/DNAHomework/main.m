//
//  main.m
//  DNAHomework
//
//  Created by Евгений on 04.11.12.
//  Copyright (c) 2012 Jeck labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        // Создание последовательностей
        Cell *firstDna = [[Cell alloc] init];
        Cell *secondDna = [[Cell alloc] init];
        
        // И вывод их на экран просто для наглядности
        NSLog(@"First DNA %@", firstDna);
        NSLog(@"Second DNA %@", secondDna);
        NSLog(@"Hamming distance is %i", [firstDna hammingDistance:secondDna]);
        
        // Если поставить значение мутации 100 то последовательности
        // не будт совпадать ни в одном символе
        [firstDna mutate: 10];
        [secondDna mutate: 10];
        
        // И снова вывод данных на экран
        NSLog(@"First DNA %@", firstDna);
        NSLog(@"Second DNA %@", secondDna);
        NSLog(@"New hamming distance is %i", [firstDna hammingDistance:secondDna]);
        
    }
    return 0;
}


//
//  main.m
//  DNApp
//
//  Created by Oleksandr Gnatisin on 02.11.12.
//  Copyright (c) 2012 Oleksandr Gnatisin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Cell.h"  // Импорт созданного класса Cell
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Создание екземпляров класса CELL
        Cell *myCell1, *myCell2;
        
        myCell1 = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        
        // Инициализация метода проверки на несовпадения
        int hammingDistance1 = [myCell1 hammingDistance:myCell2];
        
        // Инициализация метода мутирования
        [myCell1 mutate:30];
        [myCell2 mutate:60];
        
        // Инициализация метода проверки на несовпадения после мутации
        int hammingDistance2 = [myCell1 hammingDistance:myCell2];
        
        
        NSLog(@"Найденно несовпадений в двух ДНК: %d", hammingDistance1);
        NSLog(@"Найденно несовпадений после мутации: %d", hammingDistance2);

//      NSLog(@"Array1: %@, Array2: %@", [myCell1 dna], [myCell2 dna]);
        
    }
    return 0;
}


//
//  main.m
//  osx-project-1
//
//  Created by Alex Bakoushin on 09.11.12.
//  Copyright (c) 2012 Alex Bakoushin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Объявление переменных
        Cell *cell1, *cell2;
        
        // Инициализация переменных
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        // Вычисление расстояния Хэмминга
        int hammingDistance = [cell1 hammingDistance: cell2];

        // Вывод расстояния Хэмминга
        NSLog(@"%i", hammingDistance);
        
        // Мутирование переменных
        [cell1 mutate: 70];
        [cell2 mutate: 30];

        // Вычисление расстояния Хэмминга
        hammingDistance = [cell1 hammingDistance: cell2];
        
        // Вывод расстояния Хэмминга
        NSLog(@"%i", hammingDistance);
        
    }
    return 0;
}


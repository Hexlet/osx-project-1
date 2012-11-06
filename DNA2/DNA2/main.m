//
//  main.m
//  DNA2
//
//  Created by Evgeny Pozdnyakov on 04.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

// включение (1) и выключение (0) режима отладки
#define DEBUGMODE 0

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        // создаем первую клетку
        Cell * cellA = [[Cell alloc] init];
        if (DEBUGMODE) {
            [cellA printDna];
        }
        
        // создаем вторую клетку
        Cell * cellB = [[Cell alloc] init];
        if (DEBUGMODE) {
            [cellB printDna];
        }
        
        // выводим расстояние Хэмминга
        NSLog(@"Hamming distance before mutation: %d\n", [cellA hammingDistance:cellB]);
        if (DEBUGMODE) {
            NSLog(@"Hamming distance from other side: %d\n", [cellB hammingDistance:cellA]);
        }
        
        // задаем процент мутации
        int mutationPercent = 5;

        // мутируем каждую из клеток
        [cellA mutate:mutationPercent];
        if (DEBUGMODE) {
            [cellA printDna];
        }

        [cellB mutate:mutationPercent];
        if (DEBUGMODE) {
            [cellB printDna];
        }

        // снова выводим расстояние Хэмминга
        NSLog(@"Hamming distance after %d%% mutation: %d\n", mutationPercent, [cellA hammingDistance:cellB]);
        if (DEBUGMODE) {
            NSLog(@"Hamming distance from other side: %d\n", [cellB hammingDistance:cellA]);
        }
    }
    return 0;
}


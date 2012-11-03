//
//  main.m
//  ProjectDNA
//
//  Created by Anton Samoylov on 02.11.12.
//  Thank's ssein for a little method random chars.
//  Copyright (c) 2012 Anton Samoylov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1,*cell2;
        //Инициализируем 2 массива ДНК
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        //Печтаем для проверки
        [cell1 printArray];
        [cell2 printArray];
        
        //Проверяем на совпадения
        NSLog(@"Didn't math - %i",[cell1 hammingDistance:cell2]);
        NSLog(@"\n");
        
        //Мутим 2 массива
        [cell1 mutate:50];
        [cell2 mutate:50];
        
        //Печатаем вновь для проверки
        [cell1 printArray];
        [cell2 printArray];
        
        //Проверяем на совпадения
        NSLog(@"Didn't math - %i",[cell1 hammingDistance:cell2]);
    }
    return 0;
}


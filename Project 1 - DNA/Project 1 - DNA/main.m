//
//  main.m
//  Project 1 - DNA
//
//  Created by Дмитрий Кузнецов on 05.11.12.
//  Copyright (c) 2012 Dmitriy Kuznetsov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *myCell, *alienCell;
    
        //Инициализируем и генерируем последовательность
        myCell = [[Cell alloc]init];
        alienCell = [[Cell alloc]init];
        
//Выводит строку ДНК на экран. В задании не требуется, поэтому закомментировано, но удобно для проверки
        
//      NSLog(@"My Cell before mutation: %@", [myCell printDna]);
//      NSLog(@"Alien Cell before mutation: %@", [alienCell printDna]);
        
        //Вызываем метод hammingDistance для сравнения
        NSLog(@"Hamming distance before mutation: %d", [myCell hammingDistance:alienCell]);
        
        //Мутируем
        [myCell mutate:10];
        [alienCell mutate:20];

//Выводит строку ДНК на экран. В задании не требуется, поэтому закомментировано, но удобно для проверки
//      NSLog(@"My Cell after mutation: %@", [myCell printDna]);
//      NSLog(@"Alien Cell after mutation: %@", [alienCell printDna]);
        
        NSLog(@"Hamming distance after mutation: %d", [myCell hammingDistance:alienCell]);
        

    }
    return 0;
}


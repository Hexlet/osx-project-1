//
//  main.m
//  DNA
//
//  Created by Александр on 04.11.12.
//  Copyright (c) 2012 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *dnaFirst, *dnaSecond;
        //Выделяем память и инициализируем объект 1
        dnaFirst=[[Cell alloc ] init];
        
         //Выделяем память и инициализируем объект 2
        dnaSecond=[[Cell alloc ] init];
        
        //Выводим 2 днк до мутации на экран
        NSLog(@"Первая ДНК %@",[dnaFirst getString]);
        NSLog(@"Вторая ДНК %@",[dnaSecond getString]);
        
        //Выводим разницу между ними.
        NSLog(@"Разница %d",[dnaFirst hammingDistance:dnaSecond]);
        
        
        //Мутируем
        NSLog(@"Мутация");
        [dnaFirst mutate:5];
        [dnaSecond mutate:5];
        NSLog(@"Первая ДНК %@",[dnaFirst getString]);
        NSLog(@"Вторая ДНК %@",[dnaSecond getString]);
        NSLog(@"Разница %d",[dnaFirst hammingDistance:dnaSecond]);
        
    }
    return 0;
}


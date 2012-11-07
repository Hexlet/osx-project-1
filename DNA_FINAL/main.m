//
//  main.m
//  DNA
//
//  Created by Пользователь Пользователь on 03.11.12.
//  Copyright (c) 2012 Работа. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cell.h"
#import "mutate.h"


int main (int argc, const char * argv[])
{
    
    @autoreleasepool {
        //Создадим 2 ДНК
        Cell *DNA1, *DNA2;

        DNA1 = [[Cell alloc] init];
        DNA2 = [[Cell alloc] init];
        
        NSLog(@"Исходные ДНК");
        [DNA1 print]; 
        [DNA2 print];
        NSLog(@"Различие = %i",[DNA1 hammingDistance:DNA2]);
        
        //Мутируем ДНК
        [DNA1 mutate:10];
        [DNA2 mutate:20];
        
        NSLog(@"Мутировавшие ДНК");
        [DNA1 print];
        [DNA2 print];
        NSLog(@"Различие = %i",[DNA1 hammingDistance:DNA2]);
        
        //Освобождаем память от объектов
        [DNA1 release];
        [DNA2 release];
    }
    return 0;
}



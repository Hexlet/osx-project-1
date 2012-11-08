//
//  main.m
//  DNA
//
//  Created by Vasiliy Shevchuk on 11/7/12.
//  Copyright (c) 2012 Vasiliy Shevchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        int mutate_percent = 30; // процент мутации
        
        // значение длины DNA_length задаю в файле Cell.h
        
        //Шаг А
        
        Cell *myCell1 = [[Cell alloc] init]; // создаем две клетки
        Cell *myCell2 = [[Cell alloc] init]; // и их ДНК автоматичесски вычисляется
        
        //логи для контроля работы и отладки
        //NSLog(@"dna1->%@",mar.DNA);
        //NSLog(@"dna2->%@",mar2.DNA);
        
        int count = [myCell1 hammingDistance: myCell2]; // находим количество отличий
        NSLog(@"[А]hamming distance->%i", count);   // выводим hamming distance
        
        //Шаг Б
        
        if (mutate_percent >= 0 && mutate_percent <= 100 ){
            
        
        
        [myCell1 mutate: mutate_percent];       // мутируем ДНК обеих клеток
        [myCell2 mutate: mutate_percent];      // обеих клеток
        
        //NSLog(@"mutdna1->%@",mar.DNA);
        //NSLog(@"mutdna2->%@",mar2.DNA);
        
        count = [myCell1 hammingDistance: myCell2];  // находим количество отличий
        NSLog(@"[Б]hamming distance->%i", count);  // выводим hamming distance
        }else{
            NSLog(@"[Б] Введено некорректное значение процента мутации!");  // выводим
        }
    }
    return 0;
}


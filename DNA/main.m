//
//  main.m
//  DNA
//
//  Created by Vasiliy Shevchuk on 11/7/12.
//  Copyright (c) 2012 Vasiliy Shevchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

    -(void) mutate:(int)x_percent;

@end

@implementation Cell (mutator)

-(void) mutate:(int)x_percent {
    int mutable_elements = (int)(DNA_length*x_percent/100); // вычисляем количество изменяемых елементов
    //NSLog(@"elem->%i",mutable_elements);
    NSMutableArray *mutableElementsArray = [[NSMutableArray alloc] init]; // массив позиций DNA для изменения
    for (int i = 0; i < mutable_elements; i++){
        [mutableElementsArray addObject:[NSString stringWithFormat:@"%i", -1]];   // заполняем промежуточными значениями
    }
    //NSLog(@"000mutelemarr->%@",mutableElementsArray);
    for (int i = 0; i < mutable_elements;){
        int elem = arc4random()%DNA_length;   // находим случайный елемент для изменения
        int count = 0;
        for (int j = 0 ; j < mutable_elements; j++){
            if (mutableElementsArray[j] != [NSString stringWithFormat:@"%i", elem]){ // проверяем не обрабатывался ли ранее
                count++;
            }
        }
        if (count == mutable_elements){
            mutableElementsArray[i] = [NSString stringWithFormat:@"%i", elem]; // если нет пишем его в массив позиций
            //NSLog(@"count->%i",count);
        }else{
            continue; //если да берем другой случайный елемент
        }
        i++;
    }
    //NSLog(@"mutelemarr->%@",mutableElementsArray);
    
    // Мутируем выбраные елементы
    NSArray *variant = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    for (int i = 0; i < mutable_elements; i++){
        int position = [[NSString stringWithFormat:@"%@", mutableElementsArray[i]] intValue]; // елемент с номером position
        int elem = arc4random()%4;  // вычисляем новое случайное значение
        self.DNA[position] = [NSString stringWithFormat:@"%@",variant[elem]]; // и записываем его в DNA
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        int mutate_percent = 30; // процент мутации
        
        //Шаг А
        
        Cell *myCell1 = [[Cell alloc] init]; // создаем две клетки
        Cell *myCell2 = [[Cell alloc] init]; // и их ДНК автоматичесски вычисляется
        
        //логи для контроля работы и отладки
        //NSLog(@"dna1->%@",mar.DNA);
        //NSLog(@"dna2->%@",mar2.DNA);
        
        int count = [myCell1 hammingDistance: myCell2]; // находим количество отличий
        NSLog(@"[А]hamming distance->%i", count);   // выводим hamming distance
        
        //Шаг Б
        
        [myCell1 mutate: mutate_percent];       // мутируем ДНК обеих клеток
        [myCell2 mutate: mutate_percent];      // обеих клеток
        
        //NSLog(@"mutdna1->%@",mar.DNA);
        //NSLog(@"mutdna2->%@",mar2.DNA);
        
        count = [myCell1 hammingDistance: myCell2];  // находим количество отличий
        NSLog(@"[Б]hamming distance->%i", count);  // выводим hamming distance
    }
    return 0;
}


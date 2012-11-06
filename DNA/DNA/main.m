//
//  main.m
//  DNA
//
//  Created by Ivan Sokolov on 03.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell ()
-(void) showDNA:(NSMutableArray *) t;//Вывод ДНК 
@end

@interface Cell (mutator)
-(void) mutate:(int)x;
@end

@implementation Cell (mutator)    

-(void) mutate:(int)x
{ 
    NSMutableArray *tmp = [self _DNA];//сохраняем ДНК во временную переменную 
    
    x = x*100/[tmp count] ;//Вычисляем процент
    
    for (int i=0; i<x; i++) { //цикл на количество %

//-------------------------------------------------------//       
    NSMutableString *chr_new = [NSMutableString string];//Сгенерированный символ
    NSMutableString *chr_old = [NSMutableString string];//Старый символ
//-------------------------------------------------------// 
       
       
       int numReplace[100]; //массив для исключения повторной генерации ячейки
   
       for (int k=0; k<100; k++) {
           numReplace[k]=0;
       }
       //Заполняем массив нулями(0-не изменен,1-изменен)
       
       int num;//текущая позиция
       
       do {
           num = arc4random()%[tmp count];
       } while (numReplace[num]==1);
       //Поиск случайно позиции, элемент который еще не изменяли
       
       do {
           chr_new = [DNAValue objectAtIndex:arc4random()%4];
           chr_old = [tmp objectAtIndex:num];
       } while (chr_new==chr_old);
       //Генерируем новый символ, пока он будет отличным от старого
       
        [tmp replaceObjectAtIndex:num withObject:chr_new];//заменяем значение ячейки
       numReplace[num]=1;//Отмечаем, что уже изменили текущий эелемент
    }

    [self set_DNA:tmp];//Задаем измененное значение ДНК   

    
}

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //Создаем 2 ДНК
        Cell *cel1 = [[Cell alloc]init];
        Cell *cel2 = [[Cell alloc]init];

        
        //Выводим ДНК
        NSLog(@"First DNA: ");
        [cel1 showDNA:[cel1 _DNA]];
        
        NSLog(@"Second DNA: ");
        [cel1 showDNA:[cel2 _DNA]];
        
        
        NSLog(@"hammingDistance= %i",[cel1 hammingDistance:cel2]);
        
        [cel1 mutate:[cel1 hammingDistance:cel2]];
        
        [cel1 showDNA:[cel1 _DNA]];
        
    }
    return 0;
}


//
//  main.m
//  hometask
//
//  Created by Дмитрий Голубев on 05.11.12.
//  Copyright (c) 2012 Дмитрий Голубев Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (Mutable) // категория  Mutable

-(void)mutate:(int)X; // X - количество ячеек для замены

@end

@implementation Cell (Mutable)

-(void)mutate:(int)X
{
    if (X > 100) // если кол-во процентов больше 100 сообщаем пользователю и завершаем программу с ошибкой -1
    {
        NSLog(@"The number of cells is less than or equal to 100"); exit(-1); 
    }
    
    NSMutableArray * replace = [NSMutableArray arrayWithCapacity:X]; // уникальный массив для замены клеток размером X
    
    int insertObject = 0; // будующий номер ячейки
    int repetition   = 0; // переменная для повтора цикла
    
    
    for (int i = 0; i < X; i++)
    {

       do {
            repetition = 0;
            insertObject = rand() % X; // генерируем индекс для замены
            for (int j = 0; j < i; j++)
            {
                if ([[replace objectAtIndex:j] intValue] == insertObject) repetition = 1; //если нашлась еще одна такая же ячейка с таким же нормером, устаналиваем repetition = 1
            }
            
        } while (repetition); // если repetition = 1, то повторяем цикл пока не будет уникальный индекс у ячейки
    
        [replace insertObject:[NSNumber numberWithInt:insertObject] atIndex:i]; // вставляем уникальный номер ячейки в массив замены

    
    }
    
    
    NSArray * arrayDNA = [NSArray arrayWithObjects: @"A", @"T", @"G", @"С", nil];
    NSUInteger numberoOfElements = [arrayDNA count];
    
    for (int i = 0; i < X; i++)
    {
        [self.DNA insertObject:[arrayDNA objectAtIndex:rand() % numberoOfElements] // заменяем ячейки новым значением по
                       atIndex:[[replace objectAtIndex:i]intValue]];               // индексам в replace        
    }
    
    

    
}

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // insert code here...
        Cell * cell = [[Cell alloc]init];
        Cell * cell2 = [[Cell alloc]init];
        
       
        
        int percent = 70; // кол-во процентов для замены
        
        NSLog(@"hammingDistance = %d",[cell hammingDistance:cell2]); // сравнение ДНК до замены
        
        [cell mutate:percent]; // мутируем 1-ый объект
        [cell2 mutate:percent];// мутируем 2-ой объект
                
        
        NSLog(@"hammingDistance = %d",[cell hammingDistance:cell2]); // сравниваем новые ДНК

        
    }
    return 0;
}


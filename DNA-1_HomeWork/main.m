//
//  main.m
//  DNA-1_HomeWork
//
//  Created by Sergii Savitskyi on 05.11.12.
//  Copyright (c) 2012 Musician. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutable)

-(void)mutate:(int)X; // X - количество ячеек для замены

@end

@implementation Cell (Mutable)

-(void)mutate:(int)X

{
    //Массив для замены клеток ДНК объемом Х
    
    NSMutableArray * replace = [NSMutableArray arrayWithCapacity:X]; 
    
    int insertObject = 0;
    int repetition   = 0; 
    
    
    for (int i = 0; i < X; i++)
    {
        
        do {
            repetition = 0;
            insertObject = rand() % X;
            for (int j = 0; j < i; j++)
            {
                //При совпадении клеток с одинаковым номером выполняется замена
                if ([[replace objectAtIndex:j] intValue] == insertObject) repetition = 1; 
                
            }
            //Цикл повторяется пока не исчезнет совпадение номеров
        } while (repetition); 
        
        
        [replace insertObject:[NSNumber numberWithInt:insertObject] atIndex:i];
        
        
    }
    
    
    NSArray * arrayDNA = [NSArray arrayWithObjects: @"A", @"T", @"G", @"С", nil];
    NSUInteger numberoOfElements = [arrayDNA count];
    
    for (int i = 0; i < X; i++)
    {
        [self.DNA insertObject:[arrayDNA objectAtIndex:rand() % numberoOfElements]                       atIndex:[[replace objectAtIndex:i]intValue]];                     
    }
    
    
    
    
}

@end


int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell * cell = [[Cell alloc]init];
        Cell * cell2 = [[Cell alloc]init];
        
        //Процент замены
        
        int percent = 70; 
        
        //Выполняем сравнение ДНК перед выполнением замены
        
        NSLog(@"hammingDistance = %d",[cell hammingDistance:cell2]); 
        
        //Мутируем заданные объекты Cell и Cell2
        
        [cell mutate:percent]; 
        [cell2 mutate:percent];
        
        //Выполняем сравнение мутировавших ДНК
        
        NSLog(@"hammingDistance = %d",[cell hammingDistance:cell2]); 
        
       /* Cell *myDNATest = [[Cell alloc] init];
        [myDNATest print];
       */ 
    }
    return 0;
}


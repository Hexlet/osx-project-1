//
//  main.m
//  DNA
//
//  Created by Александр Борунов on 01.11.12.
//  Copyright (c) 2012 Александр Борунов. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Protein.h"
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        

/*
 шаг 1 - проверяем работу класса Protein
 по умолчанию генерируются случайные белки
 
        Protein *p1 = [[Protein alloc] init];
        Protein *p2 = [[Protein alloc] init];
        Protein *p3 = [[Protein alloc] init];
        Protein *p4 = [[Protein alloc] init];

        [p1 print];
        [p2 print];
        [p3 print];
        [p4 print]; 
 
 */
        
/*
 шаг 2 - проверяем работу класса Cell с разными способами инициализации
 в этот момент удобно установить максимальную длину цепочки 10
 
        Cell *cell1 = [[Cell alloc] init]; [cell1 print];
        Cell *cell2 = [[Cell alloc] initFromCell:cell1]; // создали вторую копию клетки
        Cell *cell3 = [[Cell alloc] initFromString:@"ATGGCATTTAGC"]; 

        [cell2 setAinIndex:2];       // чуть ее изменили
        [cell2 setAinIndex:4];
        [cell2 print];
        
        NSLog(@"расстояние %i",[cell1 hammingDistance:cell2]);
        
        
        [cell2 print];
        [cell3 print];
        NSLog(@"расстояние %i",[cell2 hammingDistance:cell3]);
 */
 
/*
 шаг 3 - проверяем работу мутаций на цепочке одинаковых белков

        Cell *cell1 = [[Cell alloc] initFromString:@"TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"];
        Cell *cell2 = [[Cell alloc] initFromCell:cell1];
        [cell2 mutate:50];
        [cell1 print];
        [cell2 print];
        NSLog(@"расстояние %i",[cell1 hammingDistance:cell2]);

 */
// собственно задание
        Cell *cell1 = [[Cell alloc] init]; // [cell1 print];
        Cell *cell2 = [[Cell alloc] init]; // [cell2 print];
        NSLog(@"расстояние %i",[cell1 hammingDistance:cell2]);
        
        [cell1 mutate:50]; // [cell1 print];
        [cell2 mutate:50]; // [cell2 print];
        NSLog(@"расстояние %i",[cell1 hammingDistance:cell2]);




    }
    return 0;
}


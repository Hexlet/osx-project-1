//
//  main.m
//  DNAFactory
//
//  Created by Ilya Rezyapkin on 01.11.12.
//  Copyright (c) 2012 Ilya Rezyapkin. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void) mutate: (int) percent;

@end

@implementation Cell (mutator)

-(void) mutate:(int)percent {
    // Сколько нам надо поменять.
    int changeCount = round((MAX_NUCLEOTIDES * percent) / 100.0);
    
    // Делаем ряд цисел, перемешанных алгоритмом Фишера-Йетса
    
    NSMutableArray *fisherRow = [NSMutableArray arrayWithCapacity:MAX_NUCLEOTIDES];
    
    for (int i = 0; i < MAX_NUCLEOTIDES; i++) {
        [fisherRow addObject:[NSNumber numberWithInt:i]];
    }
    
    for (int i = 0; i < MAX_NUCLEOTIDES; i++) {
        NSNumber *temp;
        int changeIndex = arc4random() % (i + 1);
        
        temp = fisherRow[i];
        fisherRow[i] = fisherRow[changeIndex];
        fisherRow[changeIndex] = temp;
    }
    
    // Берем первые changeCount чисел из ряда Фишера, используя числа из ряда, как индексы для позиций, которые надо менять.
    for (int i = 0; i < changeCount; i++) {
        int index = [fisherRow[i] intValue];
        
        self.DNA[index] = [Cell mutateNucleotide:self.DNA[index]];
    }
}

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1, *cell2;
        
        // Инициализация двух цепочек
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        NSLog(@"DNA cells:");
        [cell1 print];
        [cell2 print];
        
        // Проверяем
        NSLog(@"Hamming distance: %d \n\n",[cell1 hammingDistance:cell2]);
        
        NSLog(@"Mutate...");
        // Мутируем
        [cell1 mutate:10];
        [cell2 mutate:20];
        
        [cell1 print];
        [cell2 print];
        
        // Снова проверяем
        NSLog(@"Hamming distance: %d",[cell1 hammingDistance:cell2]);
        
    }
    return 0;
}


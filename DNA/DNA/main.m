//
//  main.m
//  DNA
//
//  Created by Dmitriy Zhukov on 06.11.12.
//  Copyright (c) 2012 Dmitriy Zhukov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

- (void)mutate: (int) mutateProc;

@end

@implementation Cell (mutator)

- (void)mutate: (int) procentageOfMutations {

    if ((procentageOfMutations > 100) || (procentageOfMutations < 0)) { //Проверка передаваемого значения на правильность
        NSLog(@"Incorrect. Percentage should be from 0 to 100");
    }
    
    else {
    
    unsigned int numberOfcells = (self.arrayCapacity*procentageOfMutations)/100; //определяем какое количество ячеек должно быть подвергнуто изменениям
        
    NSMutableIndexSet *indexSetDNA = [[NSMutableIndexSet alloc] init]; // создаем набор для хранения случайных индексов по которым будет производиться изменение значений ячеек
    NSMutableArray *changesArrayDNA = [NSMutableArray arrayWithCapacity:numberOfcells]; // создаем массив в котором будут храниться изменения
    
        for (int i = 0; i < numberOfcells; i++) { // Последовательно заполняем indexSetDNA и changesArrayDNA
            
            unsigned int indexGen = arc4random ()%self.arrayCapacity; // Переменная которая генерирует случайные индексы от 0 до self.arrayCapacity
            
            if (![indexSetDNA containsIndex:indexGen]) { // Проверяем содержит ли indexSetDNA вновь сгенерированный индекс indexGen и если не содержит то:
                
                [indexSetDNA addIndex:indexGen]; //Добавляем индекс
                
                [changesArrayDNA addObject:[NSString stringWithFormat:@"%C", [self.rangeOfDNACellValues characterAtIndex: arc4random() % [self.rangeOfDNACellValues length]]]]; //Наполняем массив с изменениями
                
            } else {i--;} // в противном случае повторяем цикл
        }
        
    [self.DNA replaceObjectsAtIndexes:indexSetDNA withObjects:changesArrayDNA]; // Меняем целевой массив DNA
    }
}

@end







int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *firstCell = [[Cell alloc]init]; 
        Cell *secondCell = [[Cell alloc]init];
        
        unsigned int hDistance = [firstCell hammingDistance:secondCell];
        NSLog(@"%i", hDistance);
        
        [firstCell mutate:10];
        [secondCell mutate:20];
        
        hDistance = [firstCell hammingDistance:secondCell];
        NSLog(@"%i", hDistance);
        
        
    }
    
    
    
    return 0;
}


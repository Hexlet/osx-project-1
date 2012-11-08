//
//  main.m
//  DNK
//
//  Created by MiShutka on 11/8/12.
//  Copyright (c) 2012 MiShutka. All rights reserved.
//  mishutka@programist.ru

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void) mutate:(int)X;

@end

@implementation Cell (mutator)

-(void) mutate:(int)X {
    // определяем количество элементов для мутации
    int elements_to_mutate = [DNA count] * X /100;
    // количество мутировавших элементов
    int mutated_elements_count = 0;
    
    // массив для хранения признака, мутирован ли элемент с указанным индексом
    BOOL mutated_elements_indexes[[DNA count]];
    
    // инициализируем
    for (int i=0; i<[DNA count]; i++) { mutated_elements_indexes[i] = FALSE; }
    
    // временная переменная, хранящая индекс элемента
    int index = 0;
    
    while (mutated_elements_count <= elements_to_mutate) {
        index = arc4random() % [DNA count];
        // если элемент с индексом index не мутирован
        if (mutated_elements_indexes[index] == FALSE ) {
            // меняем значение
            DNA[index] = [Cell getRandomSymbol];
            // отмечаем мутацию
            mutated_elements_indexes[index] = TRUE;
            // увеличиваем счетчик
            mutated_elements_count ++;
        }
    }
    // освобождаем память
    free((void *)mutated_elements_indexes);
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        [cell1 print];
        
        Cell *cell2 = [[Cell alloc] init];
        [cell2 print];
        
        NSLog(@"%i", [cell2 hammingDistance:cell1]);
        
        [cell1 mutate:15];
        [cell2 mutate:30];
        
        NSLog(@"%i", [cell2 hammingDistance:cell1]);
        
    }
    return 0;
}


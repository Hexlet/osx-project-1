//
//  Cell+mutator.m
//  osx-project-1
//
//  Created by Alex Bakoushin on 11.11.12.
//  Copyright (c) 2012 Alex Bakoushin. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void) mutate:(int) percentOfMutation {
    
    // Вычисление объема букв, подлежащих изменению
    int amountOfMutation = DNA_LENGTH * percentOfMutation / 100;
    
    // Инициализация массива со случайными индексами букв, подлежащих изменению
    NSMutableArray *mutatedLettersIndex = [[NSMutableArray alloc] initWithCapacity: DNA_LENGTH];
    
    // Получение случайных индексов для заданного объема букв
    while ([mutatedLettersIndex count] < amountOfMutation) {
        
        // Вычисление случайного индекса буквы
        NSNumber *randomIndex = [NSNumber numberWithInt: arc4random() % DNA_LENGTH];
        
        // Проверка, есть ли в массиве случайных индексов такой уже такой индекс
        NSInteger index = [mutatedLettersIndex indexOfObject: randomIndex];
        if (index == NSNotFound) {
            // Добавление полученного индекса в массив
            [mutatedLettersIndex addObject: randomIndex];
        }
    }
    
    // Замена букв по полученным случайным индексам на случайные буквы
    for (NSNumber *objRandomIndex in mutatedLettersIndex) {
        
        // Получение случайного индекса из массива случайных индексов
        int randomIndex = [objRandomIndex intValue];
        
        // Получение случайной буквы
        NSString *randomLetter = [NSString stringWithFormat:@"%C", [LETTERS characterAtIndex: arc4random() % [LETTERS length]]];
        
        // Замена полученной случайной буквы по полученному случайному индексу
        [self.DNA replaceObjectAtIndex: randomIndex withObject: randomLetter];
    };
    
}

@end

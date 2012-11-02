//
//  Cell+Mutator.m
//  hexlet_project_DNA
//
//  Created by Igor Smirnov on 02.11.12.
//  Copyright (c) 2012 Igor Smirnov. All rights reserved.
//

#import "Cell.h"
#import "Cell+Mutator.h"

// категория класса Cell (мутация)
@implementation Cell (Mutator)

// мутация
- (void) mutate: (int) x {
    int c = round(x / 100.0f * self.DNA.count); // количество элементов для мутации
    NSMutableArray * indexes = [[NSMutableArray alloc] init]; // отобранные элементы
    
    // создаем массив из индексов всех элементов
    // потом будем удалять оттуда использованные в ходе мутации
    for (int i = 0; i < self.DNA.count; i++) {
        [indexes addObject: [NSNumber numberWithInt: i]];
    }
    
    NSInteger idx, val;
    NSString *s1, *s2;
    
    for (int i = 0; i < c; i++) {
        // выбираем случайный элемент ДНК, который еще не мутировал
        idx = arc4random() % indexes.count;
        val = [[indexes objectAtIndex: idx] integerValue];
        
        // удаляем его из списка "кандидатов на мутацию"
        [indexes removeObjectAtIndex: idx];
        
        // убеждаемся, что новый элемент отличен от старого
        s1 = [self.DNA objectAtIndex: val];
        do {
            s2 = [self getRandomPart];
        } while ([s1 isEqualToString: s2]);
        [self.DNA replaceObjectAtIndex: val withObject: s2];
    }
}

@end

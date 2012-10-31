//
//  Cell.m
//  hexlet_project_DNA
//
//  Created by Igor Smirnov on 30.10.12.
//  Copyright (c) 2012 Igor Smirnov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// выбор случайного значения элемента ДНК
- (NSString *) getRandomPart {
    switch (arc4random() % 4) {
        case 0: return @"A";
        case 1: return @"T";
        case 2: return @"G";
        case 3: return @"C";
    }
    return nil;
}

// инициализация с длиной
- (Cell *) initWithLength: (int) len {
    // вот кстати, вопрос. я так или иначе сталкивался с ним, реализуя различные идеи:
    // а, может, все-таки в обособленных инициализаторах надо
    // [self init] вместо [super init]?
    self = [super init];
    if (self) {
        self.DNA = [NSMutableArray array];
        for (int i = 0; i < len; i++) {
            [self.DNA addObject: [self getRandomPart]];
        }
    }
    return self;
}

// строка днк для NSLog(...)
- (NSString *) description {
    return [self.DNA componentsJoinedByString: @""];
}

// сравнение днк
- (int) hammingDistance: (Cell *) aCell {
    int d = 0;
    for (int i = 0; i < self.DNA.count; i++) {
        if (![[self.DNA objectAtIndex: i] isEqual: [aCell.DNA objectAtIndex: i]]) {
            d++;
        }
    }
    return d;
}

@end

// расширение класса Cell
@implementation Cell(mutator)

// мутация
- (void) mutate: (int) x {
    int c = x * self.DNA.count / 100; // количество элементов для мутации
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


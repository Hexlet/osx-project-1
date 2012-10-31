//
//  Cell.m
//  hexlet_project_DNA
//
//  Created by Igor Smirnov on 30.10.12.
//  Copyright (c) 2012 Igor Smirnov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// выбор значения ячейки ДНК
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
    self = [super init];
    if (self) {
        self.DNA = [NSMutableArray array];
        for (int i = 0; i < len; i++) {
            [self.DNA addObject: [self getRandomPart]];
        }
    }
    return self;
}

// печатаем днк
- (void) print {
    NSLog(@"%@", [self.DNA componentsJoinedByString: @""]);
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
    NSMutableArray * indexes = [NSMutableArray array]; // отобранные элементы
    int idx;
    NSString *s1, *s2; // для варианта 2 (см. ниже)
    
    for (int i = 0; i < c; i++) {
        // выбираем случайный элемент ДНК, который еще не мутировал
        do {
            idx = arc4random() % self.DNA.count;
        } while ([indexes indexOfObjectIdenticalTo: [NSNumber numberWithInt: idx]] != NSNotFound);
        
        // добавляем в список исключений для следующих мутаций
        [indexes addObject: [NSNumber numberWithInt: idx]];
        
        // убеждаемся, что новый элемент отличен от старого
        s1 = [self.DNA objectAtIndex: idx];
        do {
            s2 = [self getRandomPart];
        } while ([s1 isEqualToString: s2]);
        [self.DNA replaceObjectAtIndex: idx withObject: s2];
    }
}

@end


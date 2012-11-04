//
//  Cell.m
//  DNAHomework
//
//  Created by Евгений on 04.11.12.
//  Copyright (c) 2012 Jeck labs. All rights reserved.
//

#import "Cell.h"
#import <stdlib.h>

@implementation Cell

- (Cell *) init {
    return [self initWithCount:100];
}

// Если уж делать константу для длины последовательности то имеет смысл и сделать метод
// для создания последовательностей произвольной длины
- (Cell *) initWithCount:(int)count {
    self = [super init];
    _count = count;
    
    // Массив с нуклеидами для удобной генерации случайной последовательности
    _nucleotides = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
    
    // И сама генерации, arc4random_uniform относительно свежая функция могут быть проблемы на старых системах
    _dna = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < _count; i++) {
        [_dna addObject: [_nucleotides objectAtIndex:arc4random_uniform(4)]];
    }
    
    return self;
}

+ (Cell *) dnaWithCount:(int)count {
    return [[self alloc] initWithCount:count];
}

- (NSArray *) getDna {
    return _dna;
}

- (int) getCount {
    return _count;
}

- (int) hammingDistance:(Cell *)target {
    // Раз уж есть методы для создания последовательностей разной длины
    // надо это учесть при сравнении
    int checkCount;
    int distance;
    
    // Разность в длине записываем в растояние
    if ([target getCount] > _count) {
        checkCount = _count;
        distance = [target getCount] - _count;
    } else {
        checkCount = [target getCount];
        distance = _count - checkCount;
    }
    
    for (NSUInteger i = 0; i < checkCount; i++) {
        // Что то там было про указатели и что их нельзя сравнивать, решил перестраховаться
        if (![[_dna objectAtIndex:i] isEqual:[[target getDna] objectAtIndex:i]]) {
            distance++;
        }
    }
    return distance;
}

// Метод для вывода с помощью NSLog последовательности ДНК - просто для удобства
- (NSString *) description {
    NSMutableString *str;
    str = [NSMutableString stringWithCapacity:_count];
    
    NSEnumerator *enumerator = [_dna objectEnumerator];
    NSString *nucleotide;
    
    while (nucleotide = [enumerator nextObject]) {
        [str appendString: nucleotide];
    }
    
    return str;
}

@end

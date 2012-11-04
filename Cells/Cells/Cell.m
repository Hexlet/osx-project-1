//
//  Cell.m
//  Cells
//
//  Created by Vladimir Korshunov on 11/4/12.
//  Copyright (c) 2012 Vladimir Korshunov. All rights reserved.
//

#import "Cell.h"
#import <stdlib.h>

@implementation Cell

// Инициализация объекта, массив «ДНК» генериться
- (id) init {
    NSArray *Genome = [NSArray arrayWithObjects:@"A", @"C", @"G", @"T", nil];
    NSMutableArray *arrayDNA = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0; i < 100; ++i) {
        [arrayDNA addObject:[Genome objectAtIndex:arc4random() % 4]];
    }
    
    if (self = [self initWithArray:arrayDNA]) {
        // Ошибок нет
    }
    return self;
}

// Инициализация с массивом «ДНК»
- (id) initWithArray:(NSArray *)arrayDNA {
    if (self = [super init]) {
        DNA = [NSMutableArray arrayWithArray:arrayDNA];
    }
    return self;
}

// Возвращает конкретный геном по индексу
- (NSString *) genomeAtIndex:(int)index {
    return [DNA objectAtIndex:index];
}

// Сравнивает два массива «ДНК» и выводит количество отличающихся элементов
- (int) hammingDistance:(Cell *)another {
    int count = 0;
    
    for (int i = 0; i < [DNA count]; ++i) {
        if ([self genomeAtIndex:i] != [another genomeAtIndex:i]) {
            ++count;
        }
    }
    
    return count;
}

@end

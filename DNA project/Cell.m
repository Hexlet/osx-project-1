//
//  Cell.m
//  DNA project
//
//  Created by Sergey Starukhin on 01.11.12.
//  Copyright (c) 2012 Sergey Starukhin. All rights reserved.
//

#import "Cell.h"

@interface Cell ()

@property (nonatomic, strong) NSMutableArray *dna;

@end

@implementation Cell

// выбор случайного символа из множества вынесен в метод класса чтобы не дублировать этод код в категории
+ (id)getRandomElement {
    NSArray *elements = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    return [elements objectAtIndex:(rand() % 4)];
}

// отложенная инициализация массива на 100 элементов
- (NSMutableArray *)dna {
    if (!_dna) {
        _dna = [[NSMutableArray alloc] initWithCapacity:kLengthOfDNA];
    }
    return _dna;
}

- (id)init {
    self = [super init];
    if (self) {
        for (int i = 0; i < kLengthOfDNA; i++) {
            [self.dna addObject:[Cell getRandomElement]];
        }
    }
    return self;
}

- (int)hammingDistance:(Cell *)anotherCell {
    int distance = 0;
    for (int i = 0; i < kLengthOfDNA; i++) {
        // поэлементно сравниваем массивы и считаем несовпадения
        if (![[self.dna objectAtIndex:i] isEqualTo:[anotherCell.dna objectAtIndex:i]]) distance++;
    }
    return distance;
}

@end

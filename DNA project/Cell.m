//
//  Cell.m
//  DNA project
//
//  Created by Sergey Starukhin on 01.11.12.
//  Copyright (c) 2012 Sergey Starukhin. All rights reserved.
//

#import "Cell.h"
#import "NSSet+Randomizer.h"

@interface Cell ()

@property (nonatomic, strong) NSMutableArray *dna;

@end

@implementation Cell

// возвращаем множество возможных элементов ДНК
+ (NSSet *)possibleElements {
    static NSSet *elements;
    if (!elements) {
        elements = [NSSet setWithObjects:@"A", @"T", @"G", @"C", nil];
    }
    return elements;
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
            [self.dna addObject:[[Cell possibleElements] randomObject]];
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

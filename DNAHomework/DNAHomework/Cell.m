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

- (Cell*) init {
    self = [super init];
    
    // Массив с нуклеидами для удобной генерации случайной последовательности
    nucleotides = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
    
    // И сама генерации, arc4random_uniform относительно свежая функция могут быть проблемы на старых системах
    DNA = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < 100; i++) {
        [DNA addObject: [nucleotides objectAtIndex:arc4random_uniform(4)]];
    }
    
    return self;
}

- (int)hammingDistance:(Cell *)target {
    int distance;
    distance = 0;
    for (NSUInteger i = 0; i < 100; i++) {
        // Что то там было про указатели и что их нельзя сравнивать, решил перестраховаться
        if (![[DNA objectAtIndex:i] isEqual:[target->DNA objectAtIndex:i]]) {
            distance++;
        }
    }
    return distance;
}

// Метод для вывода с помощью NSLog последовательности ДНК - просто для удобства
- (NSString *)description {
    NSMutableString *str;
    str = [NSMutableString stringWithCapacity:100];
    
    NSEnumerator *enumerator = [DNA objectEnumerator];
    NSString *nucleotide;
    
    while (nucleotide = [enumerator nextObject]) {
        [str appendString: nucleotide];
    }
    
    return str;
}

@end

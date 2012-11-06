//
//  Cell.m
//  DNA2
//
//  Created by Evgeny Pozdnyakov on 04.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

// включение (1) и выключение (0) режима отладки
#define DEBUGMODE 0

@implementation Cell

+ (NSString *) getRandomNucleotide {
    if (DEBUGMODE) {
        NSLog(@"call [Cell getRandomNucleotide] ");
    }

    // генерируем случайный индекс от 0 до 3
    int randomIndex = arc4random() % 4;

    // на основе индекса вытаскиваем соответствующий символ из массива нуклеотидов
    char nucleotideChar = nucleotides[randomIndex];

    // на основе символа создаем объект типа NSString
    NSString * nucleotideObj = [NSString stringWithFormat:@"%c",nucleotideChar];

    if (DEBUGMODE) {
        NSLog(@"index %d, char %c\n", randomIndex, nucleotideChar);
    }
    
    // и возвращаем его
    return nucleotideObj;
}

- (Cell *) init {
    if (DEBUGMODE) {
        NSLog(@"call [Cell init]\n");
    }
    
    // вызываем метод init родительского класса
    self = [super init];
    
    // инициализируем поле DNA
    self->DNA = [NSMutableArray arrayWithCapacity:nucleotidesInDna];
    
    // заполняем поле DNA случайной цепью нуклеотидов
    [self fillDnaOnce];

    // возвращаем объект
    return self;
}

- (void) fillDnaOnce {
    if (DEBUGMODE) {
        NSLog(@"call [Cell fillDnaOnce]\n");
    }
    
    // убеждаемся, что поле DNA не было заполнено
    if ([self->DNA count] > 0) {
        if (DEBUGMODE) {
            NSLog(@"\nCALL [Cell fillDnaOnce] FOR AN OBJECT WITH NOT EMPTY DNA\n\n");
        }
    } else {
        // заполняем цепь ДНК случайными нуклеотидами
        int i = 0;
        while (i++ < nucleotidesInDna) {
            [self->DNA addObject:[Cell getRandomNucleotide]];
        }
        if (DEBUGMODE) {
            [self printDna];
        }
    }
}

- (void) printDna {
    if (DEBUGMODE) {
        NSLog(@"call [Cell printDna]\n");
    }
    
    // если цепь ДНК заполнена
    if ([self->DNA count] == nucleotidesInDna) {
        // выводим нуклеотиды с разделителем "-"
        NSLog(@"%@\n", [self->DNA componentsJoinedByString:@"-"]);
    } else {
        if (DEBUGMODE) {
            NSLog(@"\nDNA IS EMPTY OR NOT COMPLETE\n\n");
        }
    }
}

- (int) hammingDistance:(Cell *)cellToCompare {
    if (DEBUGMODE) {
        NSLog(@"call [Cell hammingDistance:]\n");
    }
    
    // сравниваем нуклеотиды в одинаковых позициях
    // и подсчитываем количество несовпадений
    int i;
    int mismatches = 0;
    for (i = 0; i < nucleotidesInDna; i++) {
        if (![[self->DNA objectAtIndex:i] isKindOfClass:[NSString class]]) {
            if (DEBUGMODE) {
                NSLog(@"OBJECT IN self->DNA AT POSITION %d HAS WRONG TYPE\n", i);
            }
        } else if (![[cellToCompare->DNA objectAtIndex:i] isKindOfClass:[NSString class]]) {
            if (DEBUGMODE) {
                NSLog(@"OBJECT IN cellToCompare->DNA AT POSITION %d HAS WRONG TYPE\n", i);
            }
        } else if ([self->DNA objectAtIndex:i] != [cellToCompare->DNA objectAtIndex:i]) {
            mismatches++;
        }
    }
    
    // возвращаем кол-во несовпадений
    return mismatches;
}

@end

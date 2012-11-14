//
//  Cell.m
//  DNA
//
//  Created by Alex Demchenko on 12.11.12.
//  Copyright (c) 2012 Alex Demchenko. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init {
    // вызываем init метод родителя
    self = [super init];
    // инициализируем массив
    DNA = [NSMutableArray arrayWithCapacity:100];
    if (self) {
        // генерация случайных значений из множества {A, T, G, C}
        char newCharDNA = ' ';
        for (int i=0; i<100; i++) {
            int newDNA = arc4random() % 4;
            
            if (newDNA == 0) {
                newCharDNA = 'A';
            } else if (newDNA == 1) {
                newCharDNA = 'T';
            } else if (newDNA == 2) {
                newCharDNA = 'G';
            } else if (newDNA == 3) {
                newCharDNA = 'C';
            }
            
            // заполнение 100 ячеек ДНК случайными значениями
            [DNA addObject:[NSString stringWithFormat:@"%c", newCharDNA]];
        }
    }
    return self;
}

-(int)hammingDistance:(Cell *)cellObject {
    // считаем количество позиций, где значения не совпадают
    int count = 0;
    for (int i=0; i<100; i++) {
        if ([self->DNA objectAtIndex:i] != [cellObject->DNA objectAtIndex:i])
            count++;
    }
    return count;
}

@end

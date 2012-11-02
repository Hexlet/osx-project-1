//
//  Cell.m
//  osx-project-1
//
//  Created by Максим Пелевин on 02.11.12.
//  Copyright (c) 2012 Максим Пелевин. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// Инициализирование объекта
-(id) init {
    self = [super init];
    if (self) {
        // инициализируем массив, чтобы принять 100 объектов
        DNA = [NSMutableArray arrayWithCapacity:100];
        // временный массив с именами молекул A, T, C, G
        NSArray *molecules = [NSArray arrayWithObjects: @'A', @'T', @'C', @'G', nil];
        // заполняем массив ДНК, случайно выбирая молекулы из предыдущего массива
        for (int i = 0; i < 100; i++) {
            int randomIndex = (arc4random() % 2) * (arc4random() % 2);
            [DNA insertObject: [molecules objectAtIndex:randomIndex] atIndex:i];
        }
    }
    return self;
}


// Считаем расстояние хамминга (?)
-(int) hammingDistance:(Cell *)cell {
    int hammingDistance = 0;
    for (int i = 0; i < 100; i++) {
        // В тот момент, когда две молекулы различаются на одинаковых позициях
        
        if ([DNA objectAtIndex:i] != [cell->DNA objectAtIndex:i]) {
            hammingDistance++;
        }
    }
    return hammingDistance;
}

@end

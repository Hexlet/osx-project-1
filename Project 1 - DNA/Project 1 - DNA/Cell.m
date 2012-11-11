//
//  Cell.m
//  Project 1 - DNA
//
//  Created by Artemati on 08.11.12.
//  Copyright (c) 2012 Artemati. All rights reserved.
//

#import "Cell.h"

@implementation Cell
{
    // Массив для символ из множества A, T, G, C
    NSArray *symbols;
}

-(id) init {
    self = [super init];
    if (self) {
        // Создаю массив из 100 символов
        self.dna = [NSMutableArray arrayWithCapacity:100];
        // Заполняю рандомными значениями
        for (int i=0; i<100; i++) {
            [self.dna addObject:[self randomSymbol]];
        }
    }
    return self;
}

// Функция возвращает рандомный символ из множества A, T, G, C
-(NSString *) randomSymbol{
    symbols = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
    return [symbols objectAtIndex:arc4random() % 4];
}

-(int) hammingDistance:(Cell *)cell{
    // Переменная для хранения позиций, где ДНК не совпадают
    int distance = 0;
    for (int i = 0; i < 100; i++) {
        if (![[self.dna objectAtIndex:i] isEqualTo:[cell.dna objectAtIndex:i]]){
            distance++;
        }
    }
    return distance;
}

-(void)print {
    NSLog(@"%@", self.dna);
}

@end

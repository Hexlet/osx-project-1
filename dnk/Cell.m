//
//  Cell.m
//  dnk
//
//  Created by ssein on 30.10.12.
//  Copyright (c) 2012 ssein. All rights reserved.
//

#import "Cell.h"

// Длина цепочки ДНК
int const DNA_SIZE = 100;
// Массив с возможными элементами
static const NSArray *DNATypes;

@implementation Cell

+(NSString *) getRandomElement {
    // Заполняем массив с возможными элементами цепочки
    if(DNATypes == nil) DNATypes = @[@"A", @"T", @"G", @"C"];
    // Возвращаем рандомный элемент
    return DNATypes[arc4random() % [DNATypes count]];
}

// инициализация
-(id) init{

    self = [super init];
    // объявляем массив с нужным размером
    _dna = [NSMutableArray arrayWithCapacity:DNA_SIZE];
    // Заполняем цепочку ДНК случайными элементами
    for (int dna_i = 0; dna_i < DNA_SIZE; dna_i++) {
        [_dna addObject: [Cell getRandomElement]];
    }
    return self;
}

// Вычисляем разницу в цепочках
-(int) hammingDistance:(Cell *)c {
    // начальное значение дистанции
    int distance = 0;
    for (int dna_i = 0; dna_i < DNA_SIZE; dna_i++) {
        // увеличиваем счетчик, если элементы не совпадают
        if([[self dna] objectAtIndex:dna_i] != [[c dna] objectAtIndex:dna_i]) distance++;
    }
    return distance;
}
// вывод цпочки ДНК
-(void)print {
    NSLog(@"%@",[_dna componentsJoinedByString:@""]);
}
@end

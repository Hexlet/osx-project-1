//
//  Cell.m
//  mac101p1DNA
//
//  Created by Voleg on 31.10.12.
//  Copyright (c) 2012 Voleg. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    // генерация DNA
    // обертка для имитации значения по умолчанию
    return [self initLength:100];
}
    // Непосредственная инициализация атрибута DNA
-(id) initLength:(int) l{
    self = [super init];
    if (self) {
    // Хотим получить DNA путем генерации в дополнительном методе класса makeDNA:l
        DNA = [NSMutableArray arrayWithArray:[self makeDNA:l]]; 
    }
    return self;
}
    // Генерация массива с определенной длиной makeDNA:l
-(NSMutableArray *) makeDNA:(long int)l {
    NSMutableArray *dnacells = [[NSMutableArray alloc] init];
    dnacells = [NSMutableArray arrayWithCapacity:l];
    
    // обращаемся к newNucleotide за новым случайным нуклеотидом
    for (int i = 0; i < l; i++)[dnacells addObject:[self newNucleotide]];
    return dnacells;
}
    // Генерируем новый нуклеотид
-(NSString *) newNucleotide {
    mols = [[NSArray alloc] initWithObjects:@"A", @"C", @"G", @"T", nil];
    return [mols objectAtIndex:arc4random()%mols.count];
}

// возвращаем случайное число не более length
-(int) getRandomNumber:(NSUInteger) length {
    return (arc4random() % length);
}

-(int) hammingDistance:(Cell *)cell {
    int hd = 0;
    for (int i=0;i < cell->DNA.count ;i++) {
        if (![[self->DNA objectAtIndex:i] isEqual:[cell->DNA objectAtIndex:i]])
        {
            hd++;
        }
    }
    return hd;
}

@end


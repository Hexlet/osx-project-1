//
//  DNACell.m
//  DNA Test
//
//  Created by Evgeny Golubev on 30.10.12.
//  Copyright (c) 2012 Evgeny Golubev. All rights reserved.
//

#import "Cell.h"

@implementation Cell;

-(id) init {
    self = [super init];

    if (self) {
        //Инициализируем ДНК необходимой длинны
        DNA = [[NSMutableArray alloc] initWithCapacity:DNA_LENGHT];
        
        for (int i=0; i<DNA_LENGHT; i++) {
            //Заполняем случайным нуклеоидом, для генерации случайного индекса используем arc4random_uniform (позволяет задать границу для генерации)
            [DNA addObject:[self.getNucleotides objectAtIndex:arc4random_uniform(NUKLEOTIDES_LENGHT)]];
        }
    }
    
    return self;
}

-(NSMutableArray*) getDNA {
    return DNA;
}

-(NSArray*) getNucleotides {
	//Возвращаем массив с нуклотидами
    return [NSArray arrayWithObjects:@"A",@"T",@"G",@"C",nil];
}

-(int) hammingDistance: (Cell *) DNAForHamming {
    //Инициализируем счётчик несоответствий
    int hamming = 0;
    
    for (int i=1; i<DNA_LENGHT; i++) {
        //Сравниваем поэлементно и в случае несоответствия увеличиваем счётчик
        if([[DNA objectAtIndex:i] isEqual: [[DNAForHamming getDNA] objectAtIndex:i]]) {
            hamming++;
        }
    }
    
    return hamming;
}

@end
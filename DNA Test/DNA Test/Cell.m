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
        DNA = [NSMutableArray arrayWithCapacity:DNA_LENGHT];
        
        for (int i=0; i<DNA_LENGHT; i++) {
            //Заполняем случайным нуклеоидом
            [DNA addObject:[Cell getRandomNucleotide]];
        }
    }
    
    return self;
}

-(NSMutableArray*) getDNA {
    return DNA;
}

+(NSString*) getRandomNucleotide {
	//Определяем статический массив
	static NSArray *nucleotides;
	
	//Если массив не инициализирован, инитим и наполняем
	if (!nucleotides)
	{
		nucleotides = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C",nil];
	}
	
	//Возвращаем случайный нуклеотид
    return [nucleotides objectAtIndex:arc4random()%NUKLEOTIDES_LENGHT];
}

-(int) hammingDistance:(Cell *) DNAForHamming {
    //Инициализируем счётчик несоответствий
    int hamming = 0;
    
    for (int i=0; i<DNA_LENGHT; i++) {
        //Сравниваем поэлементно и в случае несоответствия увеличиваем счётчик
        if(![[DNA objectAtIndex:i] isEqual:[[DNAForHamming getDNA] objectAtIndex:i]]) {
            hamming++;
        }
    }
    
    return hamming;
}

@end
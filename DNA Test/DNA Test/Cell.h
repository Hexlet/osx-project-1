//
//  DNACell.h
//  DNA Test
//
//  Created by Evgeny Golubev on 30.10.12.
//  Copyright (c) 2012 Evgeny Golubev. All rights reserved.
//

#import <Foundation/Foundation.h>

//Определяем константы: длинну ДНК и длинну нуклеотидов
#define DNA_LENGHT 100
#define NUKLEOTIDES_LENGHT 4

@interface Cell : NSObject {
	//Описываем переменную для хранения ДНК с типом "изменяемый массив"
    NSMutableArray *DNA;
}


//Описываем наличие гетор для ДНК
-(NSMutableArray*) getDNA;

//Описываем наличие метода возвращающего нуклеотиды
-(NSArray*) getNucleotides;

//Описываем наличие метода сравнения
-(int) hammingDistance: (Cell *) DNAForHamming;

@end
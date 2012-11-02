//
//  DNACell+Mutator.m
//  DNA Test
//
//  Created by Evgeny Golubev on 31.10.12.
//  Copyright (c) 2012 Evgeny Golubev. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate:(int) mutatePercent {
	//Проверяем процент мутации и запускаем мутацию только в случае его корректности
    if (mutatePercent>0 && mutatePercent<=100) {
		//Определяем колличество элементов для мутации в случае если длинна ДНК больше 100
        NSUInteger mutateIndexesCount = lround(DNA_LENGHT*mutatePercent/100);
		
		//Используем метод генерации случайного надора индексов через 2 массива
		NSMutableArray *tmpIndexes, *mutateIndexes;
		
		//Один массив для индексов, второй для хранилища всех индексов
		tmpIndexes = [NSMutableArray arrayWithCapacity:DNA_LENGHT];
		mutateIndexes = [NSMutableArray arrayWithCapacity:mutateIndexesCount];
		
		//Наполняем хранилище
		for (int i=0; i<DNA_LENGHT; i++) {
			[tmpIndexes addObject:[NSNumber numberWithInteger:i]];
		}
		
		//Проводим сам процесс выдора случайных индексов из хранилища
		while (mutateIndexesCount > 0) {
			int change = arc4random()%[tmpIndexes count];
			[mutateIndexes addObject:tmpIndexes[change]];
			[tmpIndexes removeObjectAtIndex:change];
			
			mutateIndexesCount--;
		}
		
		NSString *currentNucleotide, *newNucleotide;
		
		//Проходим по всем элементам в множестве
        for (id mutateIndex in mutateIndexes) {
			//Выделяем текущий и генерируем новый нуклеотид
            currentNucleotide = [DNA objectAtIndex:[mutateIndex integerValue]];
			newNucleotide = [Cell getRandomNucleotide];
			
			//Пока новый нуклеотид равен текущему генерируем новый
			while ([currentNucleotide isEqual:newNucleotide]) {
				newNucleotide = [Cell getRandomNucleotide];
			}
			
			//Выбираем из оставшихся случайный и заменяем на него
            [DNA replaceObjectAtIndex:[mutateIndex integerValue] withObject:newNucleotide];
        }
    }
}

@end

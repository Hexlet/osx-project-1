//
//  DNACell+Mutator.m
//  DNA Test
//
//  Created by Evgeny Golubev on 31.10.12.
//  Copyright (c) 2012 Evgeny Golubev. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate: (int) mutatePercent {
	//Проверяем процент мутации и запускаем мутацию только в случае его корректности
    if (mutatePercent>0 && mutatePercent<=100) {
		//Определяем колличество элементов для мутации в случае если длинна ДНК больше 100
        int mutateIndexesCount = DNA_LENGHT*mutatePercent/100;
        
		//Для получения уникального набора индексов создаём изменяемое множество
        NSMutableSet *mutateIndexes = [[NSMutableSet alloc] initWithCapacity:mutateIndexesCount];
		
		//Пока множество не заполниться генерируем туда случайный индекс по длинне ДНК, особенность уникальности элеменов в множестве не даст дублировать индекс
        while ([mutateIndexes count]<mutateIndexesCount) {
            [mutateIndexes addObject:[NSNumber numberWithInteger:arc4random_uniform(DNA_LENGHT)]];
        }
		
		//Проходим по всем элементам в множестве
        for (id mutateIndex in mutateIndexes) {
			//Создаём изменяемый массив на основе наших нуклиотидов
            NSMutableArray *nucleotidesForMutate = [[NSMutableArray alloc] initWithArray:self.getNucleotides copyItems:YES];
			
			//Удаляем из него текущий нуклеотид для данного индекса в ДНК
            [nucleotidesForMutate removeObjectIdenticalTo:[DNA objectAtIndex:[mutateIndex integerValue]]];
			
			//Выбираем из оставшихся случайный и заменяем на него
            [DNA replaceObjectAtIndex:[mutateIndex integerValue] withObject:[nucleotidesForMutate objectAtIndex:arc4random_uniform(NUKLEOTIDES_LENGHT-1)]];
        }
    }
}

@end

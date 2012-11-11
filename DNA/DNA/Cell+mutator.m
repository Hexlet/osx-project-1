//
//  Cell+mutator.m
//  DNA
//
//  Created by Alex Makarov on 11/10/12.
//  Copyright (c) 2012 Alex Makarov. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void)mutate:(int)xPercent
{
	// Количество мутировавших оснований
	int iNBases = (int)round((DNA_SIZE*(xPercent/100)));
	// индексы, по которым будут мутировать составляющие ДНК
	NSMutableArray *rand_indexes = [[NSMutableArray alloc] initWithCapacity:iNBases];
	
	while ([rand_indexes count] < iNBases)
	{
		NSNumber *r_index = [NSNumber numberWithInt:arc4random() % DNA_SIZE];
		// проверка на уникальность индекса ячейки
		if(![rand_indexes containsObject:r_index])
		{
			[rand_indexes addObject:r_index];
			// мутируем ДНК, не отходя от кассы
			[[self DNA] replaceObjectAtIndex: [r_index intValue] withObject: [Cell getRandNBase]];
		}		
	}
}

@end

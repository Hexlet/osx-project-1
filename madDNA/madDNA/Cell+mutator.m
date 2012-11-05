//
//  Cell+mutator.m
//  madDNA
//
//  Created by Andrey Kolomoets on 03.11.12.
//  Copyright (c) 2012 Andrey Kolomoets. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void)mutate:(int)percent {
	int i;
	// индексы элементов, которые могут мутировать. изначально 0-99
	NSMutableArray *indexes = [NSMutableArray arrayWithCapacity:100];
	for (i = 0; i < 100; i++) {
		[indexes insertObject:[NSNumber numberWithInt:i] atIndex:i];
	}
	while ((100 - [indexes count]) < percent) {
		// индекс элемента для мутации из доступных случайным образом
		int idx = arc4random() % [indexes count];
		[self mutateAtPosition:[[indexes objectAtIndex:idx] intValue]];
		// индекс этого элемента исключаем из допустимых к мутированию
		[indexes removeObjectAtIndex:idx];
	}
}

@end

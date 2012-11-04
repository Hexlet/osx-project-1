//
//  main.m
//  project_1
//
//  Created by serg on 31.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (Mutator)
	-(void) mutate: (int) PercentToMutate;
@end

@implementation Cell (Mutator)
	-(void) mutate: (int) PercentToMutate{
		int randomRef;
		/// Создаем массив и заполняем его случайными индексами. Количество индексов строго 30% от длинны массива DNA
		NSMutableArray *ind_array = [NSMutableArray arrayWithCapacity:(int)(PercentToMutate/self.DNA.count*100)];
		int i=0;
		do {
			randomRef = arc4random() % [[self DNA] count];
			if(![ind_array containsObject: [NSNumber numberWithInt:randomRef]]){
				[ind_array addObject: [NSNumber numberWithInt:randomRef]];
				i++;
			}
		}while (i<(int)(PercentToMutate*100/self.DNA.count));
		
				
		

		/// Заменяем случайный элемент ДНК на случайный элемент из массива возможных значений
		for (i = 0; i < ind_array.count; i++) {
			// Проверяем чтобы значение элемента ДНК не заменялось на такое-же, каковым оно является до замены.
			do{
				randomRef = arc4random() % [self.array count];
			} while([self.DNA objectAtIndex:[(NSNumber*)[ind_array objectAtIndex:i] intValue]] ==[self.array objectAtIndex:randomRef]);
			// Собственно заменяем элемент
			[self.DNA insertObject:[self.array objectAtIndex:randomRef] atIndex: [(NSNumber*)[ind_array objectAtIndex:i] intValue]];
		}
		
		
	}
@end



int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    Cell *cell, *cell1;
		cell = [[Cell alloc] init];
		cell1 = [[Cell alloc] init];
	   	  
	   NSLog(@"%i", [cell hammingDistance:cell1]);
	   [cell mutate:30];  //мутируем первую ДНК на 30%
	   
	   [cell1 mutate:40]; //мутируем вторую ДНК на 40%
	   NSLog(@"%i", [cell hammingDistance:cell1]); 
	}
    return 0;
}


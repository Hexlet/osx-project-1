//
//  Cell.m
//  Project1
//
//  Created by kest on 10/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"


@implementation Cell

-(id)init{
	self = [super init];
	if(self){
		//создание массива DNA
		DNA = [[NSMutableArray alloc] initWithCapacity:DNALength];
		//заполнение массива случайным образом
		for(int i=0; i<100; i++)
		{
			int letterNum = arc4random()%4;
			switch (letterNum) {
				case 0:
					[DNA addObject:@"A"];
					break;
				case 1:
					[DNA addObject:@"T"];
					break;
				case 2:
					[DNA addObject:@"G"];
					break;
				case 3:
					[DNA addObject:@"C"];
					break;				
				default:
					break;
			}
		}
	}
	return self;
}

//DNA геттер
-(NSMutableArray *)getDNA{
	return DNA;
}

-(unsigned)hammingDistance:(Cell *)cell{
	unsigned hDistance = 0;
	//сравнение двух объектов для вычисления расстояния Хэмминга
	for(int i=0; i<100; i++)
	{
		if([[self getDNA] objectAtIndex:i] != [[cell getDNA] objectAtIndex:i])
			hDistance++;
	}
	
	return hDistance;
}

//вывод содержимого DNA в одну строку
-(void)printDNA{
	NSString *outString = @"";
	for(int i=0; i<[DNA count]; i++)
	{
		outString = [outString stringByAppendingString:[DNA objectAtIndex:i]];
	}
	NSLog(@"%@",outString);
}
@end

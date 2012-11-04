//
//  Cell.m
//  project_1
//
//  Created by serg on 31.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell{
	int DNACount;
	int randomRef;
}
	@synthesize DNA, array;

-(int) hammingDistance: (Cell*)cell{
	int count = 0;
	int i;
	for (i = 0; i < DNACount; i++) {
		if([self.DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i]){
			count++;
		}
	}
	return count;
}
	
-(id) init {
	self = [super init];
	if(self){
		DNACount = 100; ///количество элементов в ДНК
	
		array = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil]; // Массив возможных значений элемента ДНК
	
	
		
		DNA = [NSMutableArray arrayWithCapacity:DNACount];
		int i;
	
		//Заполняем ДНК значениями, используя случайную выборку элементов из массива возможных значений
	
		for (i = 0; i < DNACount; i++) {
			randomRef = arc4random() % [array count];
			[DNA insertObject:[array objectAtIndex:randomRef] atIndex:i];
		}
	}
	return self;
}
	
@end


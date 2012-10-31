//
//  Cell+mutator.m
//  osx-project-1
//
//  Created by Serge Kristal on 31.10.12.
//  Copyright (c) 2012 Salakhutdinov Shaukat. All rights reserved.
//

#import "Cell.h"
#import "Cell+mutator.h"

@implementation Cell (mutator)


- (void)mutate:(int)percent
{
	int count = [self count];
	int replaceCount = ( percent * [self count] ) / 100;
	
	int k[count];
	
	for (int i=0; i<count; ++i)
		k[i] = 0;
	
	for (int i=0; i<replaceCount; ++i) {
		int j;
		do {
			j =  arc4random() % (count-1);
		} while (k[j] > 0);
		
		int v = (arc4random() % 4)+1;
		k[j] = v;
	}
	
	//нужна еще проверка совпадения "старого" гена и "мутированного"
	//если одинаковы - "мутации" нет

	for (int i=0; i<count; ++i) {
		if ( k[i] > 0 ) {
			[dna replaceObjectAtIndex:i withObject:[[gen objectAtIndex:k[i]-1] lowercaseString]];
		}
	}
}


@end

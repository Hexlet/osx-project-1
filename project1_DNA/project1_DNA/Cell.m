//
//  Cell.m
//  p1DNA
//
//  Created by karga12 on 11.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

#define CELL_CAPACITY 1000
#define CHAR_COUNT 4



@implementation Cell (mutator)

-(void)mutate:(int)X{
	if (X<=0 || X>100) {
		return;
	}
	int xCount=CELL_CAPACITY*X/100;
	NSMutableArray *allIndexes=[NSMutableArray arrayWithCapacity:CELL_CAPACITY];
	for (int j=0; j<CELL_CAPACITY; j++) {
		[allIndexes addObject:[NSNumber numberWithInt:j]];
	}
	char ATGC[CHAR_COUNT]={'A','T','G','C'};
	char ATGCWithoutOldValue[CHAR_COUNT-1];
	while (xCount>0) {
		int idx=random()%allIndexes.count;
		int arrayIdx=[[allIndexes objectAtIndex:idx] intValue];
		char oldValue=[[self.array objectAtIndex:arrayIdx] charValue];
		int ATGCWithoutOldValueCount=0;
		for (int n=0; n<CHAR_COUNT; n++) {
			if (ATGC[n]==oldValue) {
				continue;
			}
			ATGCWithoutOldValue[ATGCWithoutOldValueCount++]=ATGC[n];
		}
		char newValue=ATGCWithoutOldValue[random()%(CHAR_COUNT-1)];
		[self.array replaceObjectAtIndex:arrayIdx withObject:[NSNumber numberWithChar:newValue]];
		[allIndexes removeObjectAtIndex:idx];
		xCount--;
	}
}

@end

@implementation Cell

@synthesize array;

-(id)init{
	self=[super init];
	if (self==nil) {
		return self;
	}
	
	array=[NSMutableArray arrayWithCapacity:CELL_CAPACITY];
	char ATGC[CHAR_COUNT]={'A','T','G','C'};
	for (int j=0; j<CELL_CAPACITY; j++) {
		char c=ATGC[random()%CHAR_COUNT];
		[array addObject:[NSNumber numberWithChar:c]];
	}
	return self;
}

-(int)hammingDistance:(Cell*)cell{
	int dist=0;
	for (int j=0; j<CELL_CAPACITY; j++) {
		char self_c=[[array objectAtIndex:j] charValue];
		char cell_c=[[cell.array objectAtIndex:j] charValue];
		if (self_c!=cell_c) {
			dist++;
		}
	}
	return dist;
}

-(void)print{
	NSMutableString *s=[NSMutableString stringWithCapacity:CELL_CAPACITY];
	NSRange range;
	range.length=1;
	for (int j=0; j<CELL_CAPACITY; j++) {
		NSString *char_string=[NSString stringWithFormat:@"%c",[[array objectAtIndex:j] charValue]];
		range.location=j;
		[s appendFormat:char_string];
	}
	NSLog(@"cell: %@",s);
}

@end

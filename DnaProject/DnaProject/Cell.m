//
//  Cell.m
//  DnaProject
//
//  Created by wolfmetr on 02.11.12.
//  Copyright (c) 2012 wolfmetr. All rights reserved.
//

#import "Cell.h"

const int capacity = 100;

@implementation Cell


- (id) init {
	self = [super init];
	if (self){
		_charSet = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
		_DNA = [NSMutableArray arrayWithCapacity:capacity];
		for (int i = 0; i < capacity; i++){
			[_DNA addObject:[_charSet objectAtIndex:(arc4random() % [_charSet count])]];
		}
		
	}
	return self;
}

- (int) hammingDistance:(Cell *)d{
	int result;
	for (int i = 0; i < capacity; i++){
		if (![ [_DNA objectAtIndex:i] isEqual: [[d DNA] objectAtIndex:i]]){
			result++;
		}
	}
	
	
	
	return result;
}

@end

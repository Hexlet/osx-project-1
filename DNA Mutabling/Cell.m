//
//  Cell.m
//  DNA Mutabling
//
//  Created by Artem Aminov on 11/8/12.
//  Copyright (c) 2012 Artem Aminov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init:(int)withCount {
	_nucleotidsCount = withCount;
	_nucleotids = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
	
	self = [super init];
	
	if (self) {
		_DNA = [NSMutableArray arrayWithCapacity:_nucleotidsCount];
		for (int i = 0; i < _nucleotidsCount; i++) {
			int r = arc4random() % 4;
			[_DNA addObject:_nucleotids[r]];
		}
	}
	return self;
}

-(int)hammingDistance:(Cell*)cell {
	int difference = 0;
	for (int i = 0; i < _nucleotidsCount; i++) {
		if (_DNA[i] != [cell DNA][i]) {
			difference++;
		}
	}
	// NSLog(@"%@", [_DNA componentsJoinedByString:@","]);
	// NSLog(@"%@", [[cell DNA] componentsJoinedByString:@","]);
	return difference;
}

@end
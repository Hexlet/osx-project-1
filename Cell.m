//
//  Cell.m
//  Untitled
//
//  Created by Alex on 06.11.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#include <stdlib.h>
#import "Cell.h"

NSString *chars[] = {@"A", @"T", @"G", @"C"};

@implementation Cell
@synthesize DNA = _DNA;
-(id)init {
	self = [super init];
	if (self) {
		_DNA = [NSMutableArray arrayWithCapacity:N_CHARS];
		for (int i = 0; i < N_CHARS; ++i) {
			[_DNA insertObject:chars[arc4random() % N_CHARSET] atIndex:i];
		}
	}
	return self;
}
-(int)hammingDistance:(Cell *)cell {
	int n = 0;
	for (int i = 0; i < N_CHARS; ++i) {
		if ([self.DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i])
			++n;
	}
	return n;
}
@end

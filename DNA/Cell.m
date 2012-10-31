//
//  Cell.m
//  DNA
//
//  Created by user on 30.10.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//


#import "Cell.h"

#define CAPACITY 100

@interface Cell ()
-(void) initDna;
@end


@implementation Cell


//@synthesize dnaArray;

-(id) init {
	
	if ((self = [super init])) {
		
		[self initDna];
		
	}
	
	return self;
}

-(void) initDna {
	
	symbols = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
	dnaArray = [NSMutableArray arrayWithCapacity:CAPACITY];
	for (int i = 0; i < CAPACITY; i++) {
		[[self dnaArray] addObject:[symbols objectAtIndex:arc4random()%[symbols count]]];
	}
	
}

-(int) hammingDistance:(Cell*) aDna {
	int count = 0;
	for (int i = 0; i < CAPACITY; i++) {
		if (![[[self dnaArray] objectAtIndex:i] isEqualToString:[[aDna dnaArray] objectAtIndex:i]])
			count++;
	}
	return count;
}

#pragma mark - Getter for dnaArray
-(NSMutableArray*) dnaArray {
    return dnaArray;
}

-(void) dealloc {
	
	[super dealloc];
}

@end

#import "Cell.h"
#import <stdlib.h>

@implementation Cell

@synthesize DNA = _DNA;

- (id) init {
	self = [super init];
	if (self) {
		nucleobases = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
		_DNA = [NSMutableArray array];
		for (NSUInteger i = 0; i < 100; i++) {
			[_DNA addObject: [nucleobases objectAtIndex: arc4random() % [nucleobases count]]];
		}
	}
	return self;
}

- (NSUInteger) hammingDistance: (Cell*) target {
	NSUInteger distance = 0;
	for (NSUInteger i = 0; i < [_DNA count]; i++) {
		if (![[_DNA objectAtIndex: i] isEqual: [[target DNA] objectAtIndex: i]]) {
			distance++;
		}
	}
	return distance;
}

@end

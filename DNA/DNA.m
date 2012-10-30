#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (Mutator)
-(void) mutate:(int) procent;
@end

@implementation Cell (Mutator)
-(void) mutate:(int) procent {
	int capacity = [[self dnaArray] count];
	for (int i = 0; i < capacity*procent/100; i++) {
		[[self dnaArray] replaceObjectAtIndex:arc4random()%capacity withObject:[symbols objectAtIndex:arc4random()%[symbols count]]];
	}
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	Cell* first = [[[Cell alloc] init] autorelease];
	Cell* second = [[[Cell alloc] init] autorelease];
	
	NSLog(@"befor mutate %d", [first hammingDistance:second]);
	
	[first mutate:50];
	[second mutate:40];
	
	NSLog(@"aftet mutate %d", [first hammingDistance:second]);	

	[pool drain];
    return 0;
}

@end

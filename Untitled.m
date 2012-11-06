#import <Foundation/Foundation.h>

#import "Cell.h"
#import "mutator.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	Cell *cell1 = [[Cell alloc] init];
	Cell *cell2 = [[Cell alloc] init];
	
	NSLog(@"%d", [cell1 hammingDistance:cell2]);
	
	[cell1 mutate:10];
	[cell2 mutate:50];
	
	NSLog(@"%d", [cell1 hammingDistance:cell2]);
	
	[cell1 release];
	[cell2 release];
		
    [pool drain];
    return 0;
}

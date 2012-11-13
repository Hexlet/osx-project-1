#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	Cell* firstCell = [[Cell alloc] init];
	Cell* secondCell = [[Cell alloc] init];
	
	NSLog(@"%lu", [firstCell hammingDistance: secondCell]);
	
	[firstCell mutate: 20];
	[secondCell mutate: 10];
	
	NSLog(@"%lu", [firstCell hammingDistance: secondCell]);

    [pool drain];
    return 0;
}

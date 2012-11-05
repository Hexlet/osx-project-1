#import <Foundation/Foundation.h>
#import "Cell.h"
#import "CellMutator.h"


int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	int mutationProcent1 = 50;
	int mutationProcent2 = 70;
	
	Cell *firstCell = [[Cell alloc] init];
	Cell *secondCell = [[Cell alloc] init];
	
	[firstCell printDNA];
	[secondCell printDNA];
	NSLog(@"Hamming distance before mutation: %i", [firstCell hammingDistance:secondCell]);
	
	NSLog(@"Cells mutation...");
	
	[firstCell mutate:mutationProcent1];
	[secondCell mutate:mutationProcent2];

	[firstCell printDNA];
	[secondCell printDNA];
	NSLog(@"Hamming distance after mutation: %i", [firstCell hammingDistance:secondCell]);
	
	[pool drain];
    return 0;
}

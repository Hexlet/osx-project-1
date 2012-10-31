#import <Foundation/Foundation.h>

#import "Cell.h"

int main(int argc, char *argv[])
{
	Cell *obj1 = [[Cell alloc] init];
	Cell *obj2 = [[Cell alloc] init];

	int hamming1 = [obj1 hammingDistance:obj2];
	NSLog(@"hamming1:%i", hamming1);

	[obj2 mutate:23];
	[obj1 mutate:11];

	int hamming2 = [obj1 hammingDistance:obj2];
	NSLog(@"hamming2:%i", hamming2);
	
	return 0;
}

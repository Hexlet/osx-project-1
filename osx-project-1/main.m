#import <Foundation/Foundation.h>

#import "Cell.h"

int main(int argc, char *argv[])
{
  @autoreleasepool
  {
    Cell *obj1 = [[Cell alloc] init];
    Cell *obj2 = [[Cell alloc] init];

    int hamming1 = [obj1 hammingDistance:obj2];
    NSLog(@"hamming1:%i", hamming1);
    NSLog(@"\nobj1:%@ \nobj2:%@", [obj1 description], [obj2 description]);

    [obj2 mutate:25];
    [obj1 mutate:50];

    int hamming2 = [obj1 hammingDistance:obj2];
    NSLog(@"\nobj1:%@ \nobj2:%@", [obj1 description], [obj2 description]);

    NSLog(@"hamming2:%i", hamming2);
  }
	
	return 0;
}

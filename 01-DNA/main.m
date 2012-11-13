#import <Foundation/Foundation.h>

#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, char* argv[]) {

  @autoreleasepool{

    Cell *a, *b;
    a = [[Cell alloc] init];
    b = [[Cell alloc] init];

    NSLog(@"Inital distance: %i", [a hammingDistance:b]);

    [a mutate:33];
    [b mutate:17];

    NSLog(@"Final distance: %i", [a hammingDistance:b]);

  }

  return 0;
}
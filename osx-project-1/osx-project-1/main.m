

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.m";

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        srandom((unsigned)time(NULL));

        // insert code here...
        Cell *first = [[Cell alloc] init];
        Cell *second = [[Cell alloc] init];
//        NSLog(@"First: %@", first);
//        NSLog(@"Second: %@", second);

        NSLog(@"Hamming distance: %d", [first hammingDistance:second]);
        [first mutate:20];
        [second mutate:20];
//        NSLog(@"First: %@", first);
//        NSLog(@"Second: %@", second);

        NSLog(@"Hamming distance after mutating: %d", [first hammingDistance:second]);
    }
    return 0;
}


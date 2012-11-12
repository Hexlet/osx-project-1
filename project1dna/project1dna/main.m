
#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *c = [[Cell alloc] init];
        Cell *a = [[Cell alloc] init];
        
        NSLog(@"Hamming distance before mutation equals %d", [c hammingDistance:a]);
        [c mutate:30];
        [a mutate:30];
        NSLog(@"Hamming distance after mutation equals %d", [c hammingDistance:a]);
        
    }
    return 0;
}


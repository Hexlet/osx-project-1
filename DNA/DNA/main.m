
#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        Cell *c1 = [[Cell alloc] init];
        Cell *c2 = [[Cell alloc] init];
        
        NSLog(@"%@", c1);
        NSLog(@"%@", c2);
        NSLog(@"hamming distance: %u", [c1 hammingDistance: c2]);
        
        unsigned mutationPercent1 = 77, mutationPercent2 = 25;
        
        [c1 mutate: mutationPercent1];
        [c1 mutate: mutationPercent2];
        
        NSLog(@"After Mutating...");
        
        NSLog(@"%@", c1);
        NSLog(@"%@", c2);
        NSLog(@"hamming distance: %u", [c1 hammingDistance: c2]);
    }
}


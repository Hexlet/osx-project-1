#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell* firstCell = [[Cell alloc] init];
        Cell* secondCell = [[Cell alloc] init];
        int hammingDistance = [firstCell hammingDistance:secondCell];
        
        NSLog(@"First cell:  %@", firstCell);
        NSLog(@"Second cell: %@", secondCell);
        NSLog(@"Hamming distance: %i", hammingDistance);
        
        [firstCell mutate:73];
        [secondCell mutate:33];
        hammingDistance = [firstCell hammingDistance:secondCell];
        
        NSLog(@"After mutation...");
        NSLog(@"First cell:  %@", firstCell);
        NSLog(@"Second cell: %@", secondCell);
        NSLog(@"Hamming distance: %i", hammingDistance);
        
    }
    return 0;
}


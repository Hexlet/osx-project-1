#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Distance before mutation: %i", [cell hammingDistance:cell2]);
        
        [cell mutate:13];
        [cell2 mutate:23];
        NSLog(@"Distance after mutation: %i", [cell hammingDistance:cell2]);        
    }
    return 0;
}


#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *myCell1, *myCell2;

        // Init first
        myCell1 = [[Cell alloc] init];
        [myCell1 insertRandomData];

        // Init second
        myCell2 = [[Cell alloc] init];
        [myCell2 insertRandomData];
        
        // Print
        NSLog(@"Initial sequences:");
        [myCell1 print];
        [myCell2 print];
        NSLog(@"Hamming Distance: %i\n\n", [myCell1 hammingDistance:myCell2]);
        
        // Mutation:
        NSLog(@"Sequences after mutation:");
        [myCell1 mutate:12];
        [myCell2 mutate:22];

        // Print:
        [myCell1 print];
        [myCell2 print];
        NSLog(@"Hamming Distance: %i", [myCell1 hammingDistance:myCell2]);
        
    }
    
    return 0;
}


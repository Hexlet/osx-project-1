#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
       
		Cell* cell1 = [[Cell alloc] init];
		Cell* cell2 = [[Cell alloc] init];
		
		NSLog(@"log: %i ", [cell1 hammingDistance:cell2]);
		
		[cell1 mutate:75];
		[cell2 mutate:75];
		
		NSLog(@"log: %i ", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}


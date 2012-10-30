#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        uint hd = [cell1 hammingDistance: cell2];
        
        NSLog(@"hamming distance= %d", hd);
        
        [cell1 mutate: 20];
        [cell2 mutate: 20];
        
        hd = [cell1 hammingDistance: cell2];
        
        NSLog(@"hamming distance= %d", hd);
        
    }
    return 0;
}
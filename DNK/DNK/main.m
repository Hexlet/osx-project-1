#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        Cell* cell1 = [[Cell alloc]init];//Cleate Cell 1
        Cell* cell2 = [[Cell alloc]init];//Create Cell 2
        
        //Print hamming distance for Cell1 and Cell2
        NSLog(@"Before mutation hamming distance: %d", [cell1 hammingDistance:cell2]);
        
        //Mutate both Cells.
        //Percents were not specified in task. I choose 10 and 40.
        [cell1 mutate:10];
        [cell2 mutate:100];
        
        //Print hamming distance for Cell1 and Cell2
        NSLog(@"After mutation hamming distance: %d", [cell1 hammingDistance:cell2]);        
    }
    return 0;
}


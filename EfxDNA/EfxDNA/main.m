//
//  EfxDNA Sample project
//  (c) 2012, deksden.com
//

/*
#define EFXDEBUG=1
*/
#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance between cell1 and cell2 = %i\n", [cell1 hammingDistance:cell2]);
        [cell1 mutate:25];
        [cell2 mutate:55];
        NSLog(@"Hamming distance between cell1 mutated and cell2 mutated = %i\n", [cell1 hammingDistance:cell2]);

/* JUST for reference: debug code (with small arrays):
#ifdef EFXDEBUG
        Cell *cell1 = [[Cell alloc] initWithCapacity: 6];
        
        cell1.logPrefix = @"cell1";
        [cell1 logDNA];
        NSLog(@"--");
        [cell1 mutate:100];
        [cell1 logDNA];
        NSLog(@"--");
        
        Cell *cell2 = [[Cell alloc] initWithCapacity:6];
        
        cell2.logPrefix = @"cell2";
        [cell2 logDNA];

        NSLog(@"Hamming distance between cell1 mutated and cell2 mutated = %i\n", [cell1 hammingDistance:cell2]);
#endif
*/
        
    }
    return 0;
}


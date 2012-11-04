#import <Foundation/Foundation.h>
#import "Cell+mutator.h"

//**********************       MAIN      ***************************************

int main(int argc, const char * argv[])             {

    Cell *dna1 = [[Cell alloc] init];
    Cell *dna2 = [[Cell alloc] init];
   
    NSLog (@"Hamming distance is: %i", [dna1 hammingDistance:dna2]);

    [dna1 mutate:30];
    [dna2 mutate:30];
    
    NSLog (@"Hamming distance after mutation is: %i", [dna1 hammingDistance:dna2]);

    return 0;
}
//*******************************************************************************




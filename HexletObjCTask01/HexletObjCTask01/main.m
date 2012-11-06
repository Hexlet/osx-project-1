//
//  main.m
//  HexletObjCTask01
//
//  Created by Mykola Makhin on 11/7/12.
//  Copyright (c) 2012 Mykola Makhin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

void printDna(NSMutableArray* dna) {
    unsigned long dnaLength = [dna count];
    for(int i=0;i<dnaLength; i++) {
        const char *dnaStr = [[dna objectAtIndex:i] UTF8String];
        printf(dnaStr);
    }
    printf("\n");
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cellOne = [[Cell alloc]init];
        Cell *cellTwo = [[Cell alloc]init];
        printf("Hamming distance: %d\n", [cellOne hammingDistance:cellTwo]);
        [cellOne mutate:73];
        [cellTwo mutate:37];
        printf("Hamming distance after mutation: %d\n\n", [cellOne hammingDistance:cellTwo]);
        printf("Custom tests: \n - Cell DNA:\n");
        cellOne = [[Cell alloc]init];
        Cell *cellOneClone = [cellOne clone];
        printDna([cellOne getDna]);
        printf(" - Cell clone DNA (should be same): \n");
        printDna([cellOneClone getDna]);
        [cellOne mutate:73];
        printf(" - Cell DNA after mutation 73 percent: \n");
        printDna([cellOne getDna]);
        printf(" - Hamming distance with 73 percent mutated self: %d\n", [cellOne hammingDistance:cellOneClone]);
    }
    return 0;
}




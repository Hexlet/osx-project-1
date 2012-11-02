//
//  main.m
//  DNA
//
//  Created by Павел Матвиенко on 02.11.12.
//  Copyright (c) 2012 MaMa Creative Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance between cell1 and cell2 = %i\n", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:20];
        [cell2 mutate:50];
        NSLog(@"Hamming distance between cell1 mutated and cell2 mutated = %i\n", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


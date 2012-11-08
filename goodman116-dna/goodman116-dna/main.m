//
//  main.m
//  goodman116-dna
//
//  Created by goodman116 on 11/5/12.
//  Copyright (c) 2012 goodman116. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
//        Cell *cell3 = [cell2 clone];
        
        NSLog(@"Hamming distance before mutation is: %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:15];
        [cell2 mutate:100];

//        NSLog(@"Check if this value is %i when cell2 has 100%% mutation: %i", size, [cell2 hammingDistance:cell3]);
        NSLog(@"Hamming distance after mutation is: %i", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}


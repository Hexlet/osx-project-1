//
//  main.m
//  DNATest
//
//  Created by Aliaksandr Słaŭščyk on 01.11.12.
//  Copyright (c) 2012 Aliaksandr Słaŭščyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        
        int distance = [cell1 hammingDistance:cell2];
        
        NSLog(@"Cell1 %@", cell1);
        NSLog(@"Cell2 %@", cell2);
        NSLog(@"Hamming distance %i", distance);
        
        [cell1 mutate:70];
        [cell2 mutate:10];
        
        NSLog(@"===>Mutate");
        
        distance = [cell1 hammingDistance:cell2];
        
        NSLog(@"Cell1 %@", cell1);
        NSLog(@"Cell2 %@", cell2);
        NSLog(@"Hamming distance %i", distance);
    }
    return 0;
}


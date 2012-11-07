//
//  main.m
//  mac101p1DNA
//
//  Created by Voleg on 31.10.12.
//  Copyright (c) 2012 Voleg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
//        int l = 100;
        Cell *DNACell1, *DNACell2;
//        DNACell1 = [[Cell alloc] initLength:l];
//        DNACell2 = [[Cell alloc] initLength:l];
        DNACell1 = [[Cell alloc] init];
        DNACell2 = [[Cell alloc] init];
        
        
//        NSLog(@"%@ %@", DNACell1->DNA, DNACell2->DNA);
        NSLog(@"Hamming Distance = %i", [DNACell1 hammingDistance:DNACell2]);
        
        [DNACell1 mutate:20];
        [DNACell2 mutate:39];
        
        NSLog(@"Hamming Distance = %i", [DNACell2 hammingDistance:DNACell1]);
    
    }
    return 0;
}



//
//  main.m
//  hexlet_dna
//
//  Created by Misha Shchetinin on 31.10.12.
//  Copyright (c) 2012 Misha Shchetinin. All rights reserved.
//
#include <stdlib.h>

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)

-(void) mutate: (int)x;

@end

@implementation Cell (Mutator)

-(void)mutate: (int) x {
    NSMutableArray *uniqueIndexes = [[NSMutableArray alloc]initWithCapacity:x];
    int i=0;
    NSNumber *r_number = [[NSNumber alloc]init];
    // generation if unique indexes for raplacement;
    while (i < x) {
        r_number = [NSNumber numberWithInt:arc4random() % 100];
        if ([uniqueIndexes containsObject:r_number] == NO) {
            [uniqueIndexes addObject:r_number];
            i += 1;
        }
    }
    // Replace random dna nucleotids with random values;
    for(id index in uniqueIndexes){
        self.dnaArray[[index intValue]] = [self replaceCurrentNucleotid: self.dnaArray[[index intValue]]];
    }
    
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1;
        Cell *cell2;
        
        cell1 = [[Cell alloc]init];
        cell2 = [[Cell alloc]init];
        
        [cell1 hammingDistance:cell2];
        
        [cell1 mutate:15];
        [cell2 mutate:15];
        
        [cell1 hammingDistance:cell2];
        
    }
    return 0;
}


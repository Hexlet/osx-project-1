//
//  Cell.m
//  hexlet_dna
//
//  Created by Misha Shchetinin on 31.10.12.
//  Copyright (c) 2012 Misha Shchetinin. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>

@implementation Cell {
    //NSMutableArray *dnaArray;
    NSMutableArray *dnaNucleotids;
    int counter, r_number, hammingDist;
}
-(id) init {
    self = [super init];
    if (self){
        // create DNA holder
        _dnaArray = [[NSMutableArray alloc] initWithCapacity:100];
        // create DNA items
        dnaNucleotids = [[NSMutableArray alloc]initWithObjects:@"A",@"T",@"G",@"C", nil];
        [self populateArray];
    }
    return self;
}

//fill dna array with random nucleotid
-(void) populateArray {
    for(counter=0; counter<100; counter++){
        _dnaArray[counter] = [self randomNucleotid];
    }
    
}

//generate random nucleotid
-(NSString *) randomNucleotid {
    r_number = arc4random() % 4;
    return dnaNucleotids[r_number];
}

-(void) hammingDistance: (Cell *) cell{
    hammingDist = 0;
    for(counter=0; counter<[cell.dnaArray count];counter++ ){
        if (self.dnaArray[counter] != cell.dnaArray[counter]){
            hammingDist += 1;
        }
    }
    NSLog(@"Nucleotids have missmatched %i times", hammingDist);
}

-(void) print {
    NSLog(@"%@. \n Array length is %li", _dnaArray, [_dnaArray count]);
}

@end

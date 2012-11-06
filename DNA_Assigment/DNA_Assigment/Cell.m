//
//  Cell.m
//  DNA_Assigment
//
//  Created by INOKENTII GOLOVIN on 02.11.12.
//  Copyright (c) 2012 INOKENTII GOLOVIN. All rights reserved.
//
#import "Cell.h"
#import <stdlib.h>

@implementation Cell

-(id) init {
    self = [super init];
    if(self) {
        self->DNALength = 100;
        self->geneValues = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
        self->_DNA = [self createDNA:DNALength];
    }
    return self;
}

/* Function returns DNA array with given length and random values */
-(NSMutableArray *) createDNA:(int) capacity {
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:capacity];
    
    for(int i=0;i<capacity; i++){
        //get random gene and add it to the array
        NSString *geneValue = [self getRandomGene];
        [array addObject:geneValue];
    }
    
    return array;
}

/* Function returns random gene value */
-(NSString *) getRandomGene {
    
    int geneNum = arc4random_uniform((int)[geneValues count]);
    return [geneValues objectAtIndex:geneNum];
}

-(int) hammingDistance: (Cell *) cellObj {
    
    int dCount = 0; //num of different elements
    int length = (int)[cellObj.DNA count];
    
    if(length == DNALength) {
        for(int i=0; i<length; i++){
            //compare elements of both arrays
            NSString *v1 = [self->_DNA objectAtIndex:i];
            NSString *v2 = [cellObj.DNA objectAtIndex:i];
            BOOL isEqual = [v1 isEqualToString:v2];
            //NSLog(@"%@ %@ are %i",v1,v2,isEqual);
            
            if(!isEqual) dCount++;
        }
        
    } else {
        //DNAs have different lenght so they can't be compared
        return -1;
    }
    return dCount;
}

@end

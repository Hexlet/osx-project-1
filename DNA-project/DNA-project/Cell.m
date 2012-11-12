//
//  Cell.m
//  DNA-project
//
//  Created by Sergey Gorelov on 04.11.12.
//  Copyright (c) 2012 Sergey Gorelov. All rights reserved.
//

#import "Cell.h"
#include "stdlib.h"

@implementation Cell
{
    int dnaCapacity;        //size of DNA array
}

-(id) init {
    self = [super init];
    dnaCapacity =100;
    _dna = [NSMutableArray arrayWithCapacity:dnaCapacity];
    NSArray *setOfSymb = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C",nil];
    for (int i=0; i<dnaCapacity; i++) {     //filling _dna with values
        NSInteger randomIndex = arc4random_uniform(4);
        NSString *randomChar = [setOfSymb objectAtIndex:randomIndex];
        [_dna addObject:randomChar];
    }
    return self;
}

-(int) hammingDistance:(Cell *) cellToCompare {
    int count =0;
    for (int i=0; i<dnaCapacity; i++){
        if ([[self.dna objectAtIndex:i] isEqualTo:[cellToCompare.dna objectAtIndex:i]]){
            count++;
        }
    }
    return count;
}
@end

//
//  Cell.m
//  DNA
//
//  Created on 03.11.12.
//  Copyright (c) 2012 hexlet. All rights reserved.
//

#import "Cell.h"

#define  DNA_SIZE 100

@implementation Cell
-(id) init{
    self = [super init];
    DNA = [[NSMutableArray alloc] initWithCapacity:DNA_SIZE];

    for(NSUInteger i=0; i < DNA_SIZE; ++i)
        [DNA insertObject:[self randNucleotide] atIndex:i];

    return self;
}

-(NSString*) randNucleotide {
    NSString* value;
    switch (arc4random_uniform(4)) {
        case 0:
            value = @"A";
            break;
            
        case 1:
            value = @"T";
            break;
            
        case 2:
            value = @"G";
            break;
            
        case 3:
            value = @"C";
            break;
    }
    
    return value;
}

-(NSUInteger) hammingDistance: (Cell*) in {
    NSUInteger distance = 0;
    for(NSUInteger i=0; i < DNA_SIZE; ++i) {
        if(![[DNA objectAtIndex:i] isEqualToString: [in->DNA objectAtIndex:i]])
            ++distance;
    }
    
    return distance;
}
@end

@implementation Cell (Mutator)

-(void) mutate:(NSUInteger)percent {
    if(percent > 100)
        [NSException raise: @"Invalid value" format: @"Percent value must be not greater then 100"];

    NSMutableArray* indexesArray = [[NSMutableArray alloc] initWithCapacity:DNA_SIZE];
    for(NSUInteger i=0; i < DNA_SIZE; ++i) 
        [indexesArray insertObject: [[NSNumber alloc] initWithUnsignedInteger: i] atIndex: i];
    
    for(NSUInteger i=0; i < DNA_SIZE; ++i)
        [indexesArray exchangeObjectAtIndex:i withObjectAtIndex: arc4random_uniform(DNA_SIZE)];
        
    NSUInteger mutations = (percent * DNA_SIZE) / (Float32)100;
    while(mutations) {
        NSUInteger idx = [[indexesArray objectAtIndex: mutations - 1] unsignedIntegerValue];
        NSString* newNucleotide;
        do { //check if new value is different from previous
            newNucleotide = [self randNucleotide];
        } while ([[DNA objectAtIndex:idx] isEqualToString: newNucleotide]);

        [DNA replaceObjectAtIndex: idx withObject: newNucleotide];
        --mutations;
    }
}

@end

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
    DNA = [[NSMutableArray alloc] initWithCapacity:100];

    for(NSUInteger i=0; i < DNA_SIZE; ++i)
        [DNA insertObject:[self randNucleotide] atIndex:i];

    return self;
}

-(NSString*) randNucleotide {
    NSString* value;
    switch (arc4random() % 4) {
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
        if(![[DNA objectAtIndex:i] compare: [in->DNA objectAtIndex:i]])
            ++distance;
    }
    
    return distance;
}
@end

@implementation Cell (Mutator)

-(void) mutate:(NSUInteger)percent {
    NSUInteger mutations = (percent / (Float32)DNA_SIZE) * 100;
    NSMutableSet* set = [[NSMutableSet alloc] initWithCapacity:mutations];
    while(mutations) {
        NSNumber* pos = [[NSNumber alloc] initWithUnsignedInteger: arc4random() % DNA_SIZE];
        if([set member:pos] == nil)
        {
            [DNA replaceObjectAtIndex:[pos unsignedIntegerValue] withObject:[self randNucleotide]];
            [set addObject: pos];
            --mutations;
        }
    }
}

@end

//
//  Cell.m
//  hexlet-project1
//
//  Created by Alexey Karguine on 01.11.12.
//  Copyright (c) 2012 Alexey Karguine. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {    
    self = [super init];
    if (self) {
        _alphabet = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
        _dna = [[NSMutableArray alloc] initWithCapacity:100];
        for (int i = 0; i < DNALength; i++) {
            [_dna addObject:[self getRandomSymbol]];
        }
    }
    return self;
}

-(NSArray *) getRandomSymbol {
    return [_alphabet objectAtIndex:arc4random() % [_alphabet count]];
}

-(int) hammingDistance:(Cell *)c {
    int distance = 0;
    
    for (int i = 0; i < DNALength; i++) {
        if (![[_dna objectAtIndex:i] isEqualTo:[c.dna objectAtIndex:i]]) {
            distance++;
        }
    }
    
    return distance;
}


-(NSMutableString *) getString {
    NSMutableString *str;
    str = [[NSMutableString alloc] initWithCapacity:[_dna count]];
    for (id obj in _dna) {
        [str appendString:obj];
    }
    return str;
}

@end

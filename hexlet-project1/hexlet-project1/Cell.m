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
        _alphabet = [[NSMutableArray alloc] initWithCapacity:4];
        [_alphabet addObject:@"A"];
        [_alphabet addObject:@"T"];
        [_alphabet addObject:@"G"];
        [_alphabet addObject:@"C"];
        _dna = [[NSMutableArray alloc] initWithCapacity:100];
        for (int i = 0; i < DNALength; i++) {
            [_dna addObject:[_alphabet objectAtIndex:arc4random()%[_alphabet count]]];
        }
    }
    return self;
}

-(int)hammingDistance:(Cell *)c {
    int distance = 0;
    
    for (int i = 0; i < DNALength; i++) {
        if (![[_dna objectAtIndex:i] isEqualTo:[c.dna objectAtIndex:i]]) {
            distance++;
        }
    }
    
    return distance;
}


-(void)printDNA {
    NSMutableString *str;
    str = [[NSMutableString alloc] initWithCapacity:[_dna count]];
    for (id obj in _dna) {
        [str appendString:obj];
    }
    NSLog(@"%@", str);
}

@end

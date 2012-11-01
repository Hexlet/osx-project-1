//
//  Cell.m
//  hexlet-project1
//
//  Created by Alexey Karguine on 01.11.12.
//  Copyright (c) 2012 Alexey Karguine. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>

@implementation Cell

-(id) init {
    int i;
    
    
    self = [super init];
    if (self) {
        alphabet = [[NSMutableArray alloc] initWithCapacity:4];
        [alphabet addObject:@"A"];
        [alphabet addObject:@"T"];
        [alphabet addObject:@"G"];
        [alphabet addObject:@"C"];
        dna = [[NSMutableArray alloc] initWithCapacity:100];
        for (i = 0; i < DNALength; i++) {
            [dna addObject:[alphabet objectAtIndex:arc4random()%[alphabet count]]];
        }
    }
    return self;
}

-(int)hammingDistance:(Cell *)c {
    int i, distance = 0;
    
    for (i = 0; i < DNALength; i++) {
        if (![[dna objectAtIndex:i] isEqualTo:[c->dna objectAtIndex:i]]) {
            distance++;
        }
    }
    
    return distance;
}


-(void)printDNA {
    NSMutableString *str;
    str = [[NSMutableString alloc] initWithCapacity:[dna count]];
    for (id obj in dna) {
        [str appendString:obj];
    }
    NSLog(@"%@", str);
}

@end

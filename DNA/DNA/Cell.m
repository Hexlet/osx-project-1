//
//  Cell.m
//  DNA
//
//  Created by Cyxx on 03.11.12.
//  Copyright (c) 2012 Cyxx. All rights reserved.
//

static NSArray* elements = nil;

#import "Cell.h"

@implementation Cell

-(id)init {
    if (self = [super init]) {
        dna = [NSMutableArray arrayWithCapacity:DNA_COUNT];
        for (int i = 0; i < DNA_COUNT; i++) {
            u_int32_t rnd = (arc4random() % [[Cell elements] count]);
            [dna addObject:[[Cell elements] objectAtIndex:rnd]];
        }
    }
    
    return self;
}

// common elements for all cells
+(NSArray*)elements {
    if (elements == nil) {
        elements = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    }
    return elements;
}

-(void)print {
    for (NSString *s in dna)
        printf("%s", [s UTF8String]);
    printf("\n");
}

-(NSString*)elementAtIndex: (int) dnaIndex {
    return [dna objectAtIndex:dnaIndex];
}

-(int)hammingDistance:(Cell *)c {
    int distance = 0;
    for (int i = 0; i < DNA_COUNT; i++) {
        if ([[dna objectAtIndex:i] isNotEqualTo:[c elementAtIndex:i]])
            distance++;
    }
    return distance;
}

@end

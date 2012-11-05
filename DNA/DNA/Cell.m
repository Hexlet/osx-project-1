//
//  Cell.m
//  DNA
//
//  Created by Cyxx on 03.11.12.
//  Copyright (c) 2012 Cyxx. All rights reserved.
//

static NSArray* nucleotides = nil;

#import "Cell.h"

@implementation Cell

-(id)init {
    if (self = [super init]) {
        dna = [NSMutableArray arrayWithCapacity:DNA_COUNT];
        for (int i = 0; i < DNA_COUNT; i++) {
            NSUInteger rnd = arc4random_uniform((u_int32_t)[nucleotides count]);
            [dna addObject:[[Cell nucleotides] objectAtIndex:rnd]];
        }
    }
    
    return self;
}

// common elements for all cells
+(NSArray*)nucleotides {
    if (nucleotides == nil) {
        nucleotides = @[@"A", @"T", @"G", @"C"];
    }
    return nucleotides;
}

-(void)print {
    for (NSString *s in dna)
        printf("%s", [s UTF8String]);
    printf("\n");
}

-(NSString*)nucleotideAtIndex: (int) dnaIndex {
    return [dna objectAtIndex:dnaIndex];
}

-(int)hammingDistance:(Cell *)c {
    int distance = 0;
    for (int i = 0; i < DNA_COUNT; i++) {
        if ([[self nucleotideAtIndex:i] isNotEqualTo:[c nucleotideAtIndex:i]])
            distance++;
    }
    return distance;
}

@end

//
//  Cell.m
//  dna
//
//  Created by Maksim Kuleshov on 02.11.12.
//  Copyright (c) 2012 Maksim Kuleshov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    
    if (self) {
        int lengthOfDNA = 100;
        _DNA = [NSMutableArray arrayWithCapacity:lengthOfDNA];
        _setOfDNA = @[@"A", @"T", @"G", @"C"];
        
        do {
            [_DNA addObject:[_setOfDNA objectAtIndex:(arc4random() % 4)]];
        } while ([_DNA count] < lengthOfDNA);
    }
    return self;
}

-(id) initWithLength:(int)lengthOfDNA {
    self = [super init];
    
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:lengthOfDNA];
        _setOfDNA = @[@"A", @"T", @"G", @"C"];
        
        do {
            [_DNA addObject:[_setOfDNA objectAtIndex:(arc4random() % 4)]];
        } while ([_DNA count] < lengthOfDNA);
    }
    return self;
}


-(int)hammingDistance: (Cell *)c {
    int hd = 0;
    
    NSInteger countCurrentDNA = [_DNA count];
    NSInteger countCurrentCompareDNA = [c.DNA count];
    
    NSInteger countCompare = countCurrentDNA;
    if (countCurrentDNA != countCurrentCompareDNA) {
        if (countCurrentDNA > countCurrentCompareDNA) {
            countCompare = countCurrentCompareDNA;
        }
        NSLog(@"Warning: DNA have different lengths! Only the first %li will be comparisons.", countCompare);
    }
    
    
    for (int i=0; i<countCompare; i++) {
        if ([_DNA objectAtIndex:i] != [c.DNA objectAtIndex:i]) {hd++;}
    }
    return hd;
}

@end

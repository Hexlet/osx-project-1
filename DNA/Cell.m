//
//  Cell.m
//  DNA
//
//  Created by Nik on 05.11.12.
//  Copyright (c) 2012 Nik. All rights reserved.
//

#import "Cell.h"

@implementation Cell (mutation)

-(void) mutate:(int)p {
    NSUInteger dna = [self.DNA count];
    NSUInteger dnaKeys = [self.dnaKeys count];
    int dnaIndex;
    int dnaKeysIndex;
    NSMutableIndexSet *indexes;
    NSUInteger index = [indexes firstIndex];
    
    for (int i=0; i<p; i++) {
        dnaIndex = arc4random()%dna;
        dnaKeysIndex = arc4random()%dnaKeys;
        if (index != dnaIndex) {
            if ([self.DNA objectAtIndex:dnaIndex] != [self.dnaKeys objectAtIndex:dnaKeysIndex]) {          
                    [self.DNA replaceObjectAtIndex:dnaIndex withObject:[self.dnaKeys objectAtIndex:dnaKeysIndex]];
                    [indexes addIndex: dnaIndex];
            }
        }
    }
}

@end

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        _dnaKeys = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
        _DNA = [NSMutableArray arrayWithCapacity:100];
        for (int i=0; i<100; i++) {
            NSString *dnaKey = [self.dnaKeys objectAtIndex:arc4random()%4];
            [_DNA insertObject:dnaKey atIndex:i];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)cell {
    int hd = 0;
    for (int i=0; i<100; i++) {
        if ([self.DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i]) {
            hd++;
        }
    }
    return hd;
}

-(void) print  {
    NSLog(@"DNA:%@",_DNA);
}


@end

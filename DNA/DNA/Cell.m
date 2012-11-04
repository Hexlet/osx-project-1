//
//  Cell.m
//  DNA
//
//  Created by Erik Khalimov on 01.11.12.
//  Copyright (c) 2012 Erik Khalimov. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize dna;

-(id)init
{
    int arrayCopacity = 100;
    self = [super init];
    if (self) {
        dna = [[NSMutableArray alloc] initWithCapacity:arrayCopacity];
        NSArray *simbs = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        for (int i = 0; i < arrayCopacity; i++){
            int random = arc4random() % 4;
            [dna addObject:simbs[random]];
        }
    }
    return self;
}

-(int)hammingDistance:(Cell *)cell
{
    int hamm = 0;
    for(int i =0; i < [dna count]; i++){
        if ([cell dna][i] != dna[i]){
            hamm++;
        }
    }
    return hamm;
}

@end

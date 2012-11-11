//
//  Cell.m
//  DNA
//
//  Created by D_Unknown on 11/6/12.
//  Copyright (c) 2012 D_Unknown. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    
    if (self) {
    nucleotidesArray = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil]; //array of nucleotides
    DNA = [[NSMutableArray alloc] initWithCapacity:DNA_LENGTH];
    
    for(int i=0; i<DNA_LENGTH; i++)
        [DNA insertObject:[self getNucleotide] atIndex:i]; //fill DNA array with nucleotides
    }
    return self;
}

-(NSString*) getNucleotide {
    return [nucleotidesArray objectAtIndex:(arc4random()%4)]; //get random nucleotide
}

-(int) hammingDistance:(Cell*) c {
    int dist=0;
    for (NSUInteger i=0; i<DNA_LENGTH; i++)
        if([[self->DNA objectAtIndex:i] isNotEqualTo: [c->DNA objectAtIndex:i]])
           dist++; //++ hamming distance if nucleotides are not equal
    return dist;
}
@end

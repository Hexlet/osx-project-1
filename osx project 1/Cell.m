//
//  Cell.m
//  osx project 1
//
//  Created by Nikolay Nazarov on 03.11.12.
//  Copyright (c) 2012 Nikolay Nazarov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init{
    DNA_length = 100;
    _DNA = [NSMutableArray arrayWithCapacity:DNA_length];
    nucleotides = [NSArray arrayWithObjects: @"A",@"T",@"G",@"C", nil];
    
    //fill DNA
    for (int i=0; i<DNA_length; i++) {
        [_DNA addObject: [self getRandomNucleotide]];
    }
    
    return [super init];
}

-(int)hammingDistance:(Cell *)another_cell{
    int distance = 0;
    for (int i=0; i<DNA_length; i++) {
        if([_DNA objectAtIndex:i]==[another_cell.DNA objectAtIndex:i])
            distance++;
    }
    return distance;
}

-(NSString*) getRandomNucleotide{
    int nucleotide_id = arc4random() % 3;
    return [nucleotides objectAtIndex:nucleotide_id];
}

@end

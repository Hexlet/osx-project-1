//
//  Cell.m
//  osx-project-1
//
//  Created by Aizat on 11/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    int sizeOfDNA;
    NSArray *nucleotides;
}

@synthesize DNA;

-(id)init {
    self = [super init];
    if (self) {
        sizeOfDNA = 100;
        DNA = [NSMutableArray arrayWithCapacity:sizeOfDNA];
        nucleotides = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C",nil];
        [self fillWithRandomNucleotides];
    }
    return self;
}

-(void)fillWithRandomNucleotides {
    if ([DNA count] > 0)
        [DNA removeAllObjects];
    NSInteger numberOfNucleotides = [nucleotides count];
    NSInteger rand;
    for (int i = 0; i < sizeOfDNA; i++) {
        rand = random() % numberOfNucleotides;
        [DNA addObject:[nucleotides objectAtIndex:rand]];
    }
}

-(int)hammingDistance:(Cell *)cell {
    NSMutableArray *cellDNA = cell.DNA;
    int distance = 0;
    if ([DNA count] != [cellDNA count])
        distance = sizeOfDNA;
    else
        for (int i = 0; i < [DNA count]; i++)
            if ([DNA objectAtIndex:i] != [cellDNA objectAtIndex:i])
                distance++;
    return distance;
}

-(void)print {
    NSLog(@"%@", DNA);
}
@end
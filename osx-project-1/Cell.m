//
//  Cell.m
//  osx-project-1
//
//  Created by Aizat on 11/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

static int sizeOfDNA = 100;
static NSInteger numberOfNucleotides;
static NSArray *nucleotides;

@implementation Cell

@synthesize DNA;

+(void) initialize
{
    if (!nucleotides)
    {
    	nucleotides = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C",nil];
        numberOfNucleotides = [nucleotides count];
    }
}

+(NSString *)getRandomNucleotide {
    return [nucleotides objectAtIndex:random() % numberOfNucleotides];
}

-(id)init {
    self = [super init];
    if (self) {
        DNA = [NSMutableArray arrayWithCapacity:sizeOfDNA];
        [self fillWithRandomNucleotides];
    }
    return self;
}

-(void)fillWithRandomNucleotides {
    if ([DNA count] > 0)
        [DNA removeAllObjects];
    for (int i = 0; i < sizeOfDNA; i++) {
        [DNA addObject:[[self class] getRandomNucleotide]];
    }
}

-(int)hammingDistance:(Cell *)cell {
    NSMutableArray *cellDNA = cell.DNA;
    int distance = 0;
    if ([DNA count] != [cellDNA count])
        distance = sizeOfDNA;
    else
        for (int i = 0; i < [DNA count]; i++)
            if (![[DNA objectAtIndex:i] isEqualTo:[cellDNA objectAtIndex:i]])
                distance++;
    return distance;
}

-(void)print {
    NSLog(@"%@", DNA);
}
@end
//
//  Cell.m
//  DNA-Project
//
//  Created by Dmitry on 01.11.12.
//  Copyright (c) 2012 Dmitry. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init
{
    self = [super init];
    if (self) {
       
        DNA = [[NSMutableArray alloc] initWithCapacity:maxLenght];
        for (i = 0; i < maxLenght; i++)
        {
            [DNA addObject:[self makeGen]];
        }
    }
    return self;
}

-(NSString*) makeGen
{
    NSArray *gens=[NSArray arrayWithObjects:@"A",@"T",@"G",@"C",nil];
    int r_number=arc4random()%4;
    return  [gens objectAtIndex:r_number];
}

-(int) hammingDistance:(Cell *) cell
{
    int distance=0;
    NSMutableArray *cellDNAString=[NSMutableArray arrayWithArray:[cell getDNA]];
    for (i=0; i < maxLenght; i++)
    {
        if (![[cellDNAString objectAtIndex:i] isEqual:[DNA objectAtIndex:i]])
        {
            distance++;
        }
    }
    return distance;
}

// setter and getter of DNA instance for changing value
-(NSMutableArray*) getDNA
{
    return DNA;
}
-(void) setDNA:(NSMutableArray *) newDNA
{
    DNA=newDNA;
}
+(Cell *) copyCell:(Cell*) sourceCell
{
    Cell *newCell=[[Cell alloc] init];
    [newCell setDNA:[[sourceCell getDNA] mutableCopy]]; //get mutable copy off array - for changing only clone but not a source
    return newCell;
}

@end

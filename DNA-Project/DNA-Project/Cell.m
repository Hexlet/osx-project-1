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
        //NSLog(@"Init successful Array %@",DNA);
        
    }
    return self;
}

-(NSString*) makeGen
{
    int r_number=arc4random()%4;
    NSString *rand_Gen;
    switch (r_number) {
        case 0:
            rand_Gen=@"A";
            break;
        case 1:
            rand_Gen=@"T";
            break;
        case 2:
            rand_Gen=@"G";
            break;
        case 3:
            rand_Gen=@"C";
            break;
    }
    return rand_Gen;
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

// setter and getter of DNA instance for changing
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

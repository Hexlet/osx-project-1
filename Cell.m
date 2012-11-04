//
//  Cell.m
//  DNA
//
//  Created by Arkadiy Pikalov on 10/31/12.
//  Copyright (c) 2012 Arkadiy Pikalov. All rights reserved.
//

#import "Cell.h"
#import "stdlib.h"
@implementation Cell
{

}

-(id) init{
    self = [super init];
    if(self)
    {
        self.dna = [[NSMutableArray alloc ] initWithCapacity:CELL_SIZE];
    }
    return self;
}
-(Cell*) clone{
    Cell* copy = [[Cell alloc] init];
    copy.dna = [[NSMutableArray alloc ]initWithArray:[self dna]];
    return copy;
}
-(void) generateDNA
{
    for (int i=0;i<CELL_SIZE; i++) {
        int r = arc4random()%4;
        [self.dna addObject:[NSNumber numberWithInt:r]];
    }
}

-(int) hammingDistance:(Cell*) other
{
    int distance = 0;
    for(int i=0;i<CELL_SIZE;i++)
    {
        if([[self dna] objectAtIndex:i] != [[other dna] objectAtIndex:i])
            distance++;
    }
    return distance;
}
-(void) print
{
    NSArray *types = [NSArray arrayWithObjects:@"A", @"G", @"T", @"C", nil];
    NSMutableString * string = [[NSMutableString alloc] init];
    for(int i=0;i<CELL_SIZE;i++)
    {
        int nuc = [[[self dna] objectAtIndex:i] intValue];
        [string appendString:[types objectAtIndex:nuc]];

    }
    NSLog(@"%@", string);
}

@end

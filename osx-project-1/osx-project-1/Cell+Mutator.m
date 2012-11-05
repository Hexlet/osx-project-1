//
//  Cell+Mutator.m
//  osx-project-1
//
//  Created by Ivan Ushakov on 11/5/12.
//  Copyright (c) 2012 Ivan Ushakov. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void)mutate: (int) percent
{
    NSMutableArray *mask = [NSMutableArray arrayWithCapacity: CELL_SIZE];
    for (int i = 0; i < CELL_SIZE; i++)
    {
        [mask insertObject: [NSNumber numberWithInt: 0] atIndex: i];
    }
    
    int round = 0;
    while (round < percent)
    {
        int p = arc4random() % percent;
        if ([[mask objectAtIndex: p] intValue] == 0)
        {
            [mask insertObject: [NSNumber numberWithInt: 1] atIndex: p];
            [data insertObject:[self nextMolecule: [data objectAtIndex: p]] atIndex: p];
            round = round + 1;
        }
    }
}

-(Molecule *)nextMolecule: (Molecule *) m
{
    if ([m equal: [Molecule getA]])
    {
        return [Molecule getT];
    }
    if ([m equal: [Molecule getT]])
    {
        return [Molecule getG];
    }
    if ([m equal: [Molecule getG]])
    {
        return [Molecule getC];
    }
    
    return [Molecule getA];
}

@end

//
//  Cell.m
//  osx-project-1
//
//  Created by Ivan Ushakov on 11/5/12.
//  Copyright (c) 2012 Ivan Ushakov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init
{
    self = [super init];
    if (self)
    {
        data = [NSMutableArray arrayWithCapacity: CELL_SIZE];
        for (int i = 0; i < CELL_SIZE; i++)
        {
            int n = arc4random() % 4;
            [data insertObject:[self moleculeByIndex: n] atIndex: i];
        }
    }
    
    return self;
}

-(Molecule *)moleculeAtIndex: (NSUInteger)index
{
    if (index < CELL_SIZE)
    {
        return [data objectAtIndex: index];
    }
    return nil;
}

-(NSString *)toString
{
    NSMutableString *result = [NSMutableString stringWithCapacity: CELL_SIZE];
    for (int i = 0; i < CELL_SIZE; i++)
    {
        Molecule *m = [data objectAtIndex: i];
        [result insertString: [m toString] atIndex: i];
    }
    return result;
}

-(int)hammingDistance: (Cell *)toCell
{
    int result = 0;
    for (int i = 0; i < CELL_SIZE; i++)
    {
        Molecule *a = [data objectAtIndex: i];
        Molecule *b = [toCell moleculeAtIndex: i];
        if ([a equal: b])
        {
            result = result + 1;
        }
    }
    return result;
}

-(Molecule *)moleculeByIndex: (int)index
{
    switch (index) {
        case 0:
            return [Molecule getA];
            
        case 1:
            return [Molecule getT];
            
        case 2:
            return [Molecule getG];
            
        case 3:
            return [Molecule getC];
            
        default:
            return nil;
    }
}

@end

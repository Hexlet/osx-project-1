//
//  Cell.m
//  DNA
//
//  Created by Anton on 01.11.12.
//  Copyright (c) 2012 Anton Matrenin. All rights reserved.
//

#import "Cell.h"

@implementation Cell
{
    int _DNASize;
}

-(id) init
{
    _DNASize = 100;
    self = [super init];
    if(self)
    {
        _DNA = [[NSMutableArray alloc] initWithCapacity:_DNASize];
        for (int i = 0; i<_DNASize; i++)
        {
            [_DNA addObject: [self GetRandomDNASymbol]];
        }
    }
    return self;
}

-(NSString *) GetRandomDNASymbol;
{
    int randNum = arc4random() % 4;
    NSString *result;
    
    switch (randNum)
    {
        case 0:
            result = @"A";
            break;
        case 1:
            result = @"T";
            break;
        case 2:
            result = @"G";
            break;
        case 3:
            result = @"C";
            break;
        default:
            break;
    }
    
    return result;
}


-(int) HammingDistance: (Cell *) otherDNA;
{
    int count = 0;
    for (int i = 0; i<_DNASize; i++)
        if ([_DNA objectAtIndex: i] == [otherDNA.DNA objectAtIndex: i])
            count++;
    return count;
}

@end

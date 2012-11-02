//
//  Cell.m
//  DNK
//
//  Created by Администратор on 10/25/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import "Cell.h"

@implementation Cell{    
    
}
@synthesize DNA, nucleotides, arnd;

- (int) hammingDistance:(Cell *)otherCell
{
    int distance=0;
    
    for (int i=0; i<100; i++)
    {
        if (self.DNA[i] != otherCell.DNA[i])
        {
            distance++;
        }
    }
    return distance;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        nucleotides =[[NSMutableArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        DNA = [[NSMutableArray alloc] initWithCapacity:100];
       
        for (int i=0; i<100; i++)
        {
            [DNA insertObject:nucleotides[arc4random() %4] atIndex:i];
        }
    }
    return self;
}

@end

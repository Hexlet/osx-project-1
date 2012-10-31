//
//  Cell.m
//  DNK
//
//  Created by Администратор on 10/25/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import "Cell.h"

@implementation Cell{
    int i,d;
    
}
@synthesize DNA, chars, arnd;

- (int) hammingDistance:(Cell *)otherCell
{
    d=0;
    
    for (i=0; i<100; i++)
    {
        if (self.DNA[i] != otherCell.DNA[i])
        {
            d++;
        }
    }
    return d;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        chars =[[NSMutableArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        DNA = [[NSMutableArray alloc] initWithCapacity:100];
        
        for (i=0; i<100; i++)
        {
            [DNA insertObject:chars[arc4random() %4] atIndex:i];
        }
    }
    return self;
}

@end

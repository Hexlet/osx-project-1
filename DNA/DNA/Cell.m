//
//  Cell.m
//  DNA
//
//  Created by dk on 04.11.12.
//  Copyright (c) 2012 dk. All rights reserved.
//

#import "Cell.h"

@implementation Cell


-(id) init
{
    self = [super init];
    if (self)
    {
        _dna = [NSMutableArray arrayWithCapacity:100];
        
        NSString *values[4] = {@"A", @"T", @"G", @"C"};
        
        for (int i = 0; i < 100; i++) {            
            [_dna addObject:values[arc4random() % 4]];
        }
    }
    return self;
}

-(void) print
{
    NSLog(@"%@", _dna);
}

-(int) hummingDistance:(Cell *)cell
{
    int distance = 0;
    
    for(int i = 0; i < 100; i++)
    {
        if (_dna[i] == cell.dna[i])
            distance++;
    }
    
    return distance;
}

@end

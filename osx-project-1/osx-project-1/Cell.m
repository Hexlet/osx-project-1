//
//  Cell.m
//  osx-project-1
//
//  Created by Alex Pulichkin on 06.11.12.
//  Copyright (c) 2012 Alex Pulichkin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init
{
    self = [super init];
    
    _DNA = [[NSMutableArray alloc] initWithCapacity:100];
    _charsDNA = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
//    NSLog(@"%@", _charsDNA);
    for (int i = 0; i<100; i++) {
        [_DNA addObject:[_charsDNA objectAtIndex:arc4random()% [_charsDNA count]]];
    }
//    NSLog(@"%@", _DNA);
    return self;
}

-(int)hammingDistance:(Cell *)cell
{
    int countDistance = 0;
    for (int i=0; i<100; i++) {
        if([_DNA objectAtIndex:i] != [[cell DNA] objectAtIndex:i])
        {
            countDistance++;
        }
    }
    
    return countDistance;
}


@end

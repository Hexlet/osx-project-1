//
//  Cell.m
//  HomeWork1
//
//  Created by Anton on 05.11.12.
//  Copyright (c) 2012 Anton. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init
{
    int randomCount;
    self = [super init];
    _DNA = [NSMutableArray arrayWithCapacity:100];
    NSMutableArray *arrayChars = [[NSMutableArray alloc] initWithObjects:@"A",@"T",@"G",@"C",nil];
    if ( self ) {
        for ( int i = 0; i < 100; i++) {
            randomCount = arc4random() % 4;
            [_DNA addObject:[arrayChars objectAtIndex:randomCount] ];
        }
    }
    return self;
}

-(int)hammingDistance:(Cell *)d
{
    int counter = 0;
    
    for (int i=0; i<100; i++) {
        if ([_DNA objectAtIndex:i] != [d.DNA objectAtIndex:i]) {
            counter++;
        }
    }
    return counter;
}

-(void) print
{
        NSLog(@"%@",self.DNA);
}

@end

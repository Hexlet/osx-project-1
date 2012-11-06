//
//  Cell.m
//  Progect1-DNK
//
//  Created by omoroot on 06.11.12.
//  Copyright (c) 2012 omoroot. All rights reserved.
//

#import "Cell.h"

@implementation Cell


- (id) init {
    
    
    self = [super init];
    
    NSArray *DNKLetter = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil] ; // Массив возможных значений
    
    _DNA = [NSMutableArray arrayWithCapacity:100];
    
    for (int i=0; i < 100; i++)
        [_DNA insertObject:[NSString stringWithFormat:@"%@", [DNKLetter objectAtIndex:arc4random()%4]] atIndex:i];
    
    
    return self;
    
}



- (int) hammingDistance: (Cell*) DNK {
    
    int distance = 0;
    
    for (int i=0; i < [_DNA count]; i++)
        if ([_DNA objectAtIndex:i] != [DNK.DNA objectAtIndex:i])
            distance++;
    
    NSLog(@"%d", distance);
    
    return distance;
}


@end

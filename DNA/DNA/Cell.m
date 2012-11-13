//
//  Cell.m
//  DNA
//
//  Created by Алексей Потемкин on 13.11.12.
//  Copyright (c) 2012 Алексей Потемкин. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA = _DNA;
@synthesize characters = _characters;

-(id)init{
    
    self = [super init];
    
    if (!_DNA) {
        _DNA = [[NSMutableArray alloc] init];
    }
    
    _characters = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    
    for (int i = 0; i < 100; ++i) {
        [_DNA insertObject:[_characters objectAtIndex:arc4random() % 4] atIndex:i];
    }
    
    return self;
}

-(int)hammingDistance:(Cell *)cell{
    
    int hammingDistance = 0;
    
    for (int i = 0; i < [_DNA count]; ++i) {
        if (![[_DNA objectAtIndex:i] isEqualTo:[[cell DNA] objectAtIndex:i]]) {
            hammingDistance++;
        }
    }
    
    return hammingDistance;
}

@end

//
//  Cell.m
//  DNA
//
//  Created by xxsnakerxx on 30.10.12.
//  Copyright (c) 2012 xxsnakerxx. All rights reserved.
//

#import "Cell.h"
#import <stdlib.h>

#define DNA_CAPACITY 100

@implementation Cell

- (NSArray *)dnaKeys
{
    if (!_dnaKeys) {
        return [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    }
    return _dnaKeys;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:DNA_CAPACITY];
        
        NSUInteger counter;
        for (counter = 0; counter < DNA_CAPACITY; counter++) {
            
            NSUInteger rand = (NSUInteger)(arc4random() % 4);
            
            NSString *obj = [self.dnaKeys objectAtIndex:rand];
            
            [_DNA insertObject:obj atIndex:counter];
        };
        
    }
    
    return self;
}

- (int)hammingDistance:(Cell *)cell
{
    int result = 0;
    
    NSUInteger counter;
    for (counter = 0; counter < DNA_CAPACITY; counter++) {
        if ([self.DNA objectAtIndex:counter] != [cell.DNA objectAtIndex:counter]) {
            result++;
        }
    };
    
    return result;
}

- (void)print
{
    NSMutableString *output = [NSMutableString string];

    for (id dnaKey in self.DNA) {
        [output appendString:dnaKey];
    };
    
    NSLog(@"%@\n\n", output);
}


@end

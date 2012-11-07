//
//  Cell.m
//  DNK
//
//  Created by Дмитрий Арефьев on 06.11.12.
//  Copyright (c) 2012 Дмитрий Арефьев. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        _DNA = [[NSMutableArray alloc] initWithCapacity:100];
        _many = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        
        for (int itemIndex = 0; itemIndex < 100; itemIndex++) {
            NSUInteger randomIndex = arc4random() % [_many count];
            [_DNA addObject:[_many objectAtIndex:randomIndex]];
        }
        //NSLog(@"DNA: %@", _DNA);
    }
    return self;
}

-(int) hammingDistance:(Cell *)newCell {
    int result = 0;
    
    for (int itemIndex = 0; itemIndex < 100; itemIndex++) {
        if ([_DNA objectAtIndex:itemIndex] != [newCell.DNA objectAtIndex:itemIndex]) {
            result++;
        }
    }
    
    return result;
}

@end

@implementation Cell(mutator)

-(void)mutate:(int)X {
    while (X) {
        NSUInteger randomIndex = arc4random() % [_many count];
        [_DNA replaceObjectAtIndex:X withObject:[_many objectAtIndex:randomIndex]];
        X--;
    }
}

@end

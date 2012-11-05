//
//  Cell.m
//  dna
//
//  Created by User on 31.10.12.
//  Copyright (c) 2012 d. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init {
    self = [super init];
    if (self) {
        NSArray *tempDNA = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        _DNA = [[NSMutableArray alloc] init];
        for (int i = 0; i < 100; i++) {
            [_DNA addObject:[tempDNA objectAtIndex:arc4random() % [tempDNA count]]];
        }
    }
    return self;
}

-(int)hammingDistance:(Cell *)tCell {
    int i = 0;
    int difference = 0;
    
    for (NSString * s in _DNA) {
        if (s != [tCell.DNA objectAtIndex:i]) {
            difference ++;
        }
        i++;
    }
    return difference;
}



@end

#pragma mark NSMutableArray Category

@implementation NSMutableArray (Shuffling)
// метод случайного перемешивания массива
-(void)shuffle {
    NSUInteger count = [self count];
    
    for (int i = 0; i < count; i++) {
        NSInteger merge = count - i;
        NSInteger n = (arc4random() % merge) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end
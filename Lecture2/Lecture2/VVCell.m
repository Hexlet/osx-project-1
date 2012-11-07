//
//  VVCell.m
//  Lecture2
//
//  Created by Vadim Vatlin on 11/7/12.
//  Copyright (c) 2012 Vadim Vatlin. All rights reserved.
//

#import "VVCell.h"

NSInteger const dnaLength  = 100;

@implementation VVCell

- (id) init {
    self = [super init];
    if (self) {
        dnaType = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        NSInteger dnaTypeLength = dnaType.count;
        
        self.DNA = [[NSMutableArray alloc] initWithCapacity:dnaLength];
        for (int i=0; i<dnaLength; i++) {
            [self.DNA insertObject:[dnaType objectAtIndex:arc4random() % dnaTypeLength] atIndex:i];
        }
    }
    return self;
}

- (NSInteger) hammingDistance:(VVCell*) aCell {
    NSInteger distance = 0;
    
    for (int i=0; i<dnaLength; i++) {
        if (! [[self.DNA objectAtIndex:i] isEqualToString:[aCell.DNA objectAtIndex:i]])
            distance++;
    }
    return distance;
}

@end

//mutator implementation
@implementation VVCell (mutator)

- (void) mutate:(NSInteger)count {
    NSMutableArray *rnd = [[NSMutableArray alloc] initWithCapacity:dnaLength];
    for (int i=0;i<dnaLength;i++) {
        [rnd insertObject:[NSNumber numberWithInt:i] atIndex:i];
    }
    
    NSInteger dnaTypeLength = dnaType.count;
    for (int i=0; i<count; i++) {
        int index = arc4random() % rnd.count;
        int j = [[rnd objectAtIndex:index] intValue];
        [self.DNA replaceObjectAtIndex:j withObject:[dnaType objectAtIndex:arc4random() % dnaTypeLength]];
        [rnd removeObjectAtIndex:index];
    }
}

@end

//
//  Cell.m
//  osx-project-1
//
//  Created by Alexandr on 11/4/12.
//  Copyright (c) 2012 Alexandr. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init {
    if (self = [super init]) {
        _dnaSize = 100;
        _DNA = [NSMutableArray arrayWithCapacity:_dnaSize];
        _dnaVariants = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        [self fillRandomAtPositions:[self generateIndexes]];
    }
    
    return self;
}

- (int)hammingDistance:(Cell *)compare {
    if ([_DNA count] != [compare.DNA count]) {
        return -1;
    }
    
    int distance = 0;
    
    for (int i = 0; i < _DNA.count; i++) {
        if ([_DNA objectAtIndex:i] != [compare.DNA objectAtIndex:i]) {
            distance++;
        }
    }
    
    return distance;
}

- (NSString*)randomElement {
    int r = arc4random_uniform((uint)_dnaVariants.count);
    return [_dnaVariants objectAtIndex: r];
}

- (NSMutableArray*)generateIndexes {
    NSMutableArray *indexes = [NSMutableArray arrayWithCapacity:_dnaSize];
    
    for (int i = 0; i < _dnaSize; i++) {
        [indexes addObject:[NSNumber numberWithInt:i]];
    }
    
    return indexes;
}

- (void)fillRandomAtPositions:(NSMutableArray*)indexes {
    NSString *replacement;
    
    for (int i = 0; i < indexes.count; i++) {
        int position = [[indexes objectAtIndex:i] intValue];
        do {
            replacement = self.randomElement;
        } while ([_DNA count] > position && replacement == [_DNA objectAtIndex:position]);
        
        [_DNA setObject:replacement atIndexedSubscript:position];
    }
}

- (NSString *)description {
    return [_DNA componentsJoinedByString:@""];
}

@end

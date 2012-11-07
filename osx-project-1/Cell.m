//
//  Cell.m
//  osx-project-1
//
//  Created by sergeich on 07.11.12.
//  Copyright (c) 2012 sergeich. All rights reserved.
//

#import "Cell.h"

@implementation Cell

int const DNALength = 100;

@synthesize DNA;
@synthesize genes;

- (id)init
{
    self = [super init];
    if (self) {
        genes = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        DNA = [NSMutableArray arrayWithCapacity:DNALength];
        for (int i = 0; i < DNALength; i++) {
            [DNA addObject:genes[arc4random() % [genes count]]];
        }
    }
    return self;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"%@", DNA];
}

- (int)hammingDistance:(Cell *) cell {
    int result = 0;
    if (cell) {
        for (int i = 0; i < DNALength; i++) {
            if ([[DNA objectAtIndex:i] isNotEqualTo:[[cell DNA] objectAtIndex:i]]) {
                result++;
            }
        }
    }
    return result;
}

@end

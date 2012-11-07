//
//  Cell.m
//  osx-project-1
//
//  Created by sergeich on 07.11.12.
//  Copyright (c) 2012 sergeich. All rights reserved.
//

#import "Cell.h"

@implementation Cell

NSMutableArray *DNA;
int const DNALength = 100;
NSArray *genes;

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

@end

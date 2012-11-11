//
//  Cell.m
//  Project1DNA
//
//  Created by Сергей Петрущенко on 11.11.12.
//  Copyright (c) 2012 NVision Group. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>
#import <Foundation/Foundation.h>

#define DNA_LENGTH 100

@implementation Cell

- (id)init {
    self = [super init];
    if (self) {
        self.cellVariants = [NSArray arrayWithObjects :@"A", @"T", @"G", @"C", nil];
        self.DNA = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
        for (int i = 0; i < DNA_LENGTH; i++) {
            [self.DNA addObject:self.randomCell];
        }

    }
    return self;
}

- (NSString *)randomCell {
    return [self.cellVariants objectAtIndex:arc4random() % [self.cellVariants count]];
}

- (int)hammingDistance:(Cell *)cell {
    int distance = 0;
    for (int i = 0; i < DNA_LENGTH; i++) {
        if (![[self.DNA objectAtIndex:i] isEqualTo:[cell.DNA objectAtIndex:i]])
            distance++;
    }
    return distance;
}

- (void)print {
    NSLog(@"%@", self.DNA);

}

@end

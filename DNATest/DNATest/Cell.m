//
//  Cell.m
//  DNATest
//
//  Created by Aliaksandr Słaŭščyk on 01.11.12.
//  Copyright (c) 2012 Aliaksandr Słaŭščyk. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init
{
    self = [super init];
    if(self){
        int count = 100;
        NSArray *values = [Cell DNA_VALUES];
        _DNA = [[NSMutableArray alloc] initWithCapacity:count];
        for (int i = 0; i < count; i++) {
            int idx = arc4random() % [values count];
            [_DNA insertObject:[values objectAtIndex:idx] atIndex:i];
        }
    }
    return self;
}
- (int) hammingDistance: (Cell *) cell
{
    int count = 0;
    for (int i = 0; i < [_DNA count]; i++) {
        if ([[_DNA objectAtIndex:i] isEqualToString:[cell.DNA objectAtIndex:i]]){
            continue;
        }
        count++;
    }
    return count;
}

+ (NSArray *) DNA_VALUES
{
    static NSArray *theArray;
    if (!theArray) {
        theArray = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    }
    return theArray;
}

- (NSString*) description
{
    return [_DNA componentsJoinedByString:@""];
}
@end

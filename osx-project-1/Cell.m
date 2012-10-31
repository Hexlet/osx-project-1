//
//  Cell.m
//  osx-project-1
//
//  Created by undelalune on 31.10.12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import "Cell.h"


@implementation Cell

const NSString *DNA_CODES[] = {@"A", @"T", @"G", @"C"};

- (id)init
{
    self = [super init];

    _DNA = [NSMutableArray new];
    for (int j = 0; j < 100; j++)
    {
        const NSString *dnaItem = DNA_CODES[(NSUInteger) arc4random() % 4];
        [_DNA addObject:dnaItem];
    }

    return self;
}

/**
* returns a number of mismatched codes
*/
- (int)hammingDistance:(Cell *)cell
{
    int wrongPos = 0;
    for (int j = 0; j < _DNA.count; j++)
    {
        if ([_DNA objectAtIndex:(NSUInteger) j] != [cell.DNA objectAtIndex:(NSUInteger) j])
        {
            wrongPos++;
        }
    }
    return wrongPos;
}

/**
* returns new code using
* current code value
*/
- (id)getAnotherDNACode:(NSString *)code
{
    NSString *newCode = (NSString *) DNA_CODES[(NSUInteger) arc4random() % 4];
    if (newCode != code)
    {
        return newCode;
    }
    return [self getAnotherDNACode:code];
}


@end
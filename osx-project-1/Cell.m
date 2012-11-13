//
//  Cell.m
//  osx-project-1
//
//  Created by Aleksey Laletin on 13.11.12.
//  Copyright (c) 2012 alexion. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    NSArray *letters;
}

- (id)init
{
    self = [super init];
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:100];
        letters = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        for (NSUInteger i = 0; i < 100; i++) {
            [_DNA addObject:[self getRandomLetter]];
        }
    }
    return self;
}

- (int)hammingDistance:(Cell *)cell
{
    int counter = 0;
    NSUInteger countDNA = [_DNA count];
    for (NSUInteger i = 0; i < countDNA; i++) {
        if (![[_DNA objectAtIndex:i] isEqualTo:[cell.DNA objectAtIndex:i]]) {
            counter++;
        }
    }
    return counter;
}

- (NSString *)getRandomLetter
{
    return [letters objectAtIndex:arc4random() % [letters count]];
}

@end

@implementation Cell (Mutator)

- (void)mutate:(int)percent
{
    NSMutableArray *usedIndexes = [NSMutableArray array];
    NSUInteger countDNA = [_DNA count];
    NSUInteger replaceCount = countDNA * percent / 100;
    
    while (replaceCount != 0) {
        NSNumber *index = [NSNumber numberWithUnsignedInt:(arc4random() % countDNA)];
        
        if (![usedIndexes indexOfObject:index]) {
            continue;
        }
        [_DNA replaceObjectAtIndex:[index unsignedIntValue] withObject:[self getRandomLetter]];
        [usedIndexes addObject:index];
        replaceCount--;
    }
}

@end
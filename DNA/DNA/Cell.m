//
//  Cell.m
//  DNA
//
//  Created by Anatoliy Dudarchuk on 01.11.12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import "Cell.h"

const NSUInteger DNACount = 100;

@implementation Cell

- (id)init
{
    if (self = [super init]) {
        // Initialize DNA array with random allowed chars
        DNA = [[NSMutableArray alloc] initWithCapacity:DNACount];
        
        for (NSUInteger i = 0; i < DNACount; i++) {
            [DNA addObject:[[self class] randomChar]];
        }
    }
    
    return self;
}

- (void)dealloc
{
    [DNA release];
    
    [super dealloc];
}

+ (NSString *)randomChar
{
    NSString * const allowedChars[] = { @"A", @"T", @"G", @"C" };
    const NSUInteger allowedCharsCount = sizeof(allowedChars) / sizeof(allowedChars[0]);
    
    return allowedChars[rand() % allowedCharsCount];
}

- (int)hammingDistance:(Cell *)anotherCell
{
    int diffsCount = 0;
    for (NSUInteger i = 0; i < DNACount; i++) {
        NSString *leftDNA = [DNA objectAtIndex:i];
        NSString *rightDNA = [anotherCell->DNA objectAtIndex:i];
        
        if ([leftDNA compare:rightDNA] != NSOrderedSame)
            diffsCount++;
    }
    
    return diffsCount;
}

- (NSString *)description
{
    return [DNA componentsJoinedByString:@""];
}

@end

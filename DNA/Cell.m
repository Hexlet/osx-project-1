//
//  Cell.m
//  DNA
//
//  Created by Sergey Mitskevich on 11/4/12.
//  Copyright (c) 2012 Sergey Mitskevich. All rights reserved.
//

#import "Cell.h"

@implementation Cell

static NSArray *nucleotides = nil;

- (id) init {
    self = [super init];
    if (!self) return self;
    if (!nucleotides) nucleotides = NUCLEOTIDES;
    
    // Initializing our DNA
    self.DNA = [[NSMutableArray alloc] initWithCapacity:DNA_LENGTH];
    for (int i = 0; i < DNA_LENGTH; i++)
        [self.DNA addObject: [Cell getRandomNucleotide]];
        // Replace previous line with this to debug mutation:
        // [self.DNA addObject: @"A"];

    return self;
}

+ (NSString *) getRandomNucleotide {
    return [nucleotides
            objectAtIndex: (arc4random() % [nucleotides count])];
}

+ (NSString *) getRandomNucleotideExcept: (NSString *)itemValue {
    NSMutableArray *opts = [NSMutableArray arrayWithArray:nucleotides];
    [opts removeObject:itemValue];
    return [opts
            objectAtIndex: (arc4random() % ([nucleotides count] - 1))];
}

// For debugging purposes, displays DNA representation in log.
- (void) logDNA {
    NSString *str = @"";
    for (NSString *item in self.DNA) str = [str stringByAppendingString:item];
    NSLog(@"%@", str);
}

- (int) hammingDistance: (Cell *)otherCell {
    int result = 0;
    for (int i = 0; i < DNA_LENGTH; i++)
        if([self.DNA objectAtIndex:i] != [otherCell.DNA objectAtIndex:i])
            result += 1;
    return result;
}

@end

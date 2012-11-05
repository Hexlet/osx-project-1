//
//  Cell.m
//  DNA
//
//  Created by Sergey Mitskevich on 11/4/12.
//  Copyright (c) 2012 Sergey Mitskevich. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    DNAItemValueOptions = @[@"A", @"T", @"G", @"C"];
    DNALength = 100;
    
    // Initializing our DNA
    self.DNA = [[NSMutableArray alloc] initWithCapacity:DNALength];
    for (int i = 0; i < DNALength; i++)
        [self.DNA addObject: [self getRandomDNAItemValue]];
        // Replace previous line with this to debug mutation:
        // [self.DNA addObject: @"A"];

    return self;
}

- (NSString *) getRandomDNAItemValue {
    return [DNAItemValueOptions
            objectAtIndex: (arc4random() % [DNAItemValueOptions count])];
}

- (NSString *) getRandomDNAItemValueExcept: (NSString *)itemValue {
    NSMutableArray *opts = [NSMutableArray arrayWithArray:DNAItemValueOptions];
    [opts removeObject: itemValue];
    return [opts
            objectAtIndex: (arc4random() % ([DNAItemValueOptions count] - 1))];
}

// For debugging purposes, displays DNA representation in log.
- (void) logDNA {
    NSString *str = @"";
    for (NSString *item in self.DNA) str = [str stringByAppendingString: item];
    NSLog(@"%@", str);
}

- (int) hammingDistance: (Cell *)otherCell {
    int result = 0;
    for (int i = 0; i < DNALength; i++)
        if([self.DNA objectAtIndex:i] != [otherCell.DNA objectAtIndex:i])
            result +=1;
    return result;
}

@end

//
//  Cell.m
//  Project_1
//
//  Created by Arseniy Gushin on 03.11.12.
//  Copyright (c) 2012 Arseniy Gushin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA = _DNA;

// custom initializer
- (Cell *)init
{
    self = [super init];
    if (!self)
    {
        NSLog(@"Looks like [NSObject init] returned 'nil'. There's nobody to trust in this world...");
        exit(EXIT_FAILURE);
    }
    
    NSMutableArray *newGenome = [NSMutableArray arrayWithCapacity:CHAIN_LENGTH];
    for (int i = 0; i < CHAIN_LENGTH; i++)
    {
        [newGenome addObject:[self randomDNASymbol]];
    }
    
    self.DNA = newGenome;
    
    return self;
}

// hammingDistance detects number of differences
// between self and given Cell
- (int)hammingDistance:(Cell *)cell
{
    // counter for differences
    int diffs = 0;
    
    // some additional checks
    if ((self.DNA.count != cell.DNA.count) || (self.DNA.count < CHAIN_LENGTH))
    {
        NSLog(@"Internal genome inconsistancy! Cannot proceed.");
        return EXIT_FAILURE;
    }
    
    // go through the genome and compare items
    for (int i = 0; i < self.DNA.count; i++)
    {
        // TRUE = 1, FALSE = 0
        // so increase diffs if strings are not equal
        diffs = diffs + (![[self.DNA objectAtIndex:i]isEqualToString:[cell.DNA objectAtIndex:i]]);
    }
    
    return diffs;
}

// returns one of A, T, G, C symbols randomly
- (NSString *)randomDNASymbol
{
    // var to store symbol code
    int symbolCode = [Cell randomInRangeLo:1 toHi:4];
    
    NSString *code = nil;

    // what symbol to return?
    // 1 = A
    // 2 = T
    // 3 = G
    // 4 = C
    switch (symbolCode) {
        case 1:
            code = @"A";
            break;
        case 2:
            code = @"T";
            break;
        case 3:
            code = @"G";
            break;
        case 4:
            code = @"C";
            break;
            
    }
    if (!code) NSLog(@"There was an error creating random DNA symbol!");
    
    return code;
}

// returns random number in given bounds
+ (u_int32_t)randomInRangeLo:(u_int32_t)loBound toHi:(u_int32_t)hiBound
{
    u_int32_t range = hiBound - loBound + 1;
    return loBound + arc4random_uniform(range);
}

// returns contents of the genome as one NSString
- (NSString *)stringForGenome
{
    __block NSString *genomeString = [NSString string];

    // go through the array and execute the block below
    // on each object in the array
    [self.DNA enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
    {
        genomeString = [genomeString stringByAppendingString:obj];
    }];
    
    return genomeString;
}

@end

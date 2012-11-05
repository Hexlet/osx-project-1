//
//  Cell.m
//  DNA
//
//  Created by Anton Umnitsyn on 5/11/12.
//  Copyright (c) 2012 Anton Umnitsyn. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize dna;

- (id)init {
    self = [super init];
    dna = [[NSMutableArray alloc] initWithCapacity:100];
    proteins = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    if (self) {
        for (int i=0; i < 100; i++) {
            [dna addObject:[proteins objectAtIndex:(0+arc4random()%4)]];
        }
    }
    return self;
}

- (int)hammingDistance:(Cell *)cell {
    int counter = 0;
    for (int i=0; i < [[cell dna] count]; i++) {
        if (![[[self dna] objectAtIndex:i] isEqual:[[cell dna] objectAtIndex:i]])
            counter++;
    }
    return counter;
}

- (void)printDNA {
    NSString *stringDNA = @"";
    for (NSString *p in dna) {
        stringDNA = [stringDNA stringByAppendingString:p];
    }
    NSLog(@"%@", stringDNA);
}

@end

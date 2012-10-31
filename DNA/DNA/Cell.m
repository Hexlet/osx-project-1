//
//  Cell.m
//  DNA
//
//  Created by Moonkid on 10/31/12.
//  Copyright (c) 2012 Moonkid. All rights reserved.
//


#import "Cell.h"


@implementation Cell
@synthesize dna;

- (id)init {
    if (self = [super init]) {
        [self loadDNA];
    }
    return self;
}

- (void)loadDNA {
    dna = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [dna addObject:[self generateRandomSymbol]];
    }
}

- (NSString *)generateRandomSymbol {
    NSString *result = nil;
    int newChar = arc4random()%4;
    switch (newChar) {
        case 0:
            result = @"A";
            break;
        case 1:
            result = @"T";
            break;
        case 2:
            result = @"G";
            break;
        case 3:
            result = @"C";
            break;
        default:
            result = @"A";
            break;
    }
    return result;
}

- (int)hammingDistance:(Cell *)cell {
    int result = 0;
    @try {
        for (NSUInteger i = 0; i < dna.count; i++) {
//            NSLog(@"Comparing %@ and %@", [dna objectAtIndex:i], [cell.dna objectAtIndex:i]);
            if ([[dna objectAtIndex:i] isEqualToString:[cell.dna objectAtIndex:i]]) {
                result++;
            }
        }
    }
    @catch (NSException *ex) {
        NSLog(@"\n %@ \t %@", [ex name], [ex description]);
    }
    @finally {
        return result;
    }
}

- (NSString *)description {
    NSMutableString *result = [NSMutableString string];
    for (NSString *s in dna) {
        [result appendString:s];
    }
    return result;
}

@end
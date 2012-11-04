//
//  main.m
//  osx-project-1
//
//  Created by admin on 03.11.12.
//  Copyright (c) 2012 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

- (void)mutate:(int)percent;

@end

@implementation Cell (mutator)

- (void)mutate:(int)percent {
    NSAssert(percent >= 0 && percent <=100, @"Percent should be between 0 and 100 (inclusive)");
    if (percent == 0) {
        return;
    }
    if (percent == 100) {
        [self regenerateDna];
        return;
    }
    [self doMutate:percent];
}

- (void)doMutate:(int)percent {
    NSAssert(percent > 0 && percent < 100, @"Percent should be between 0 and 100 (exclusive)");
    NSMutableArray *notMutated = [NSMutableArray arrayWithCapacity:100];
    for (NSUInteger i = 0; i < 100; i++) {
        [notMutated insertObject:[NSString stringWithFormat:@"%ld", i] atIndex:i];
    }
    NSString *randBase;
    NSUInteger randIndex;
    for (NSUInteger i = 0; i < percent; i++) {
        randIndex = [self getRandIndexFromNotMutated:notMutated];
        randBase = [self getRandomNucleoBase];
        [self.DNA replaceObjectAtIndex:randIndex withObject:randBase];
    }
}

- (NSUInteger)getRandIndexFromNotMutated:(NSMutableArray*)notMutated {
    NSUInteger notMutatedRandIndex = arc4random() % [notMutated count];
    NSString *randIndexString = [notMutated objectAtIndex:notMutatedRandIndex];
    NSUInteger randIndex = [randIndexString integerValue];
    [notMutated removeObjectAtIndex:notMutatedRandIndex];
    return randIndex;
}

@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        NSLog(@"Hamming distance: %d\n", [cell1 hammingDistance:cell2]);
        [cell1 mutate:50];
        [cell2 mutate:50];
        NSLog(@"Hamming distance: %d\n", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


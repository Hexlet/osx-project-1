//
//  Cell+MutatorTests.m
//  Project1-DNA
//
//  Created by Administrator on 04.11.12.
//  Copyright (c) 2012 Mykhailo Oleksiuk. All rights reserved.
//

#import "Cell+MutatorTests.h"
#import "Cell+Mutator.h"

@implementation Cell_MutatorTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testMutateNegativePercent
{
    // GIVE
    int percent = -10;
    Cell *actual = [[Cell alloc] init];
    
    // WHEN
    // THEN
    STAssertThrows([actual mutate:percent], @"IllegalArgumentException expected");
}

- (void)testMutate
{
    // GIVE
    int percent = 50;
    int expectedChanged = 50;
    Cell *actual = [[Cell alloc] init];
    NSArray *beforeMutate = [NSArray arrayWithArray:[actual dna]];
    
    // WHEN
    [actual mutate:percent];
    
    // THEN
    int actualChanged = 0;
    NSArray *afterMutate = [actual dna];
    
    for (int i = 0; i < [beforeMutate count]; i++) {
        NSString *beforeValue = [beforeMutate objectAtIndex:i];
        NSString *afterValue = [afterMutate objectAtIndex:i];
        if (![beforeValue isEqualToString:afterValue]) {
            actualChanged++;
        }
    }
    
    STAssertEquals(expectedChanged, actualChanged, @"Mutated unexpected amout of elements");
}

@end

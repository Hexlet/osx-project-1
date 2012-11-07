//
//  CellTests.m
//  Project1-DNA
//
//  Created by Administrator on 04.11.12.
//  Copyright (c) 2012 Mykhailo Oleksiuk. All rights reserved.
//

#import "CellTests.h"
#import "Cell.h"

@implementation CellTests

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

- (void)testNucleobases
{
    // GIVE
    NSUInteger expectedSize = 4;
    NSArray *expected = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    
    // WHEN
    NSArray *actual = [Cell nucleobases];
    
    // THEN
    STAssertEquals(expectedSize, [actual count], @"Nucleobases array is greater than expeceted");
    STAssertEqualObjects(expected, actual, @"Nucleobases array is invalid");
}

- (void)testInitCell
{
    // GIVE
    NSUInteger expectedSize = 100;
   
    // WHEN
    Cell *actual = [[Cell alloc] init];
    
    // THEN
    STAssertEquals(expectedSize, [[actual dna] count], @"Unexpected size of dna");
}

- (void)testHammingDistance
{
    // GIVE
    int expectedHammingDistance = 3;
    
    NSMutableArray *first = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    Cell *cell1 = [[Cell alloc] init];
    [cell1 setDna:first];
    
    NSMutableArray *second = [NSArray arrayWithObjects:@"A", @"A", @"A", @"A", nil];
    Cell *cell2 = [[Cell alloc] init];
    [cell2 setDna:second];
    
    // WHEN
    int actualHammingDistance = [cell1 hammingDistance:cell2];
    
    // THEN
    STAssertEquals(expectedHammingDistance, actualHammingDistance, @"Unexpected hamming distance");
}

@end

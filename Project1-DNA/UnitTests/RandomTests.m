//
//  UnitTests.m
//  UnitTests
//
//  Created by Administrator on 04.11.12.
//  Copyright (c) 2012 Mykhailo Oleksiuk. All rights reserved.
//

#import "RandomTests.h"
#import "Random.h"

@implementation RandomTests

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

- (void)testRandomIntegerNegativeUpperBound
{
    // GIVE
    int upperBound = -1;
    
    // WHEN        
    // THEN
    STAssertThrows([Random randomInteger:upperBound], @"IllegalArgumentException expected");
}

- (void)testRandomIntegerZeroUpperBound
{
    // GIVE
    int upperBound = 0;
    
    // WHEN
    int actual = [Random randomInteger:upperBound];
    
    // THEN
    STAssertEquals(upperBound, actual, @"Random integer value is not equal 0");
}


- (void)testRandomIntegerPositiveUpperBound
{
    // GIVE
    int upperBound = 10;
    
    // WHEN
    int actual = [Random randomInteger:upperBound];
    
    // THEN
    STAssertTrue((actual >= 0 && actual < upperBound), @"Random integer is out of expected range");
}

- (void)testUniqueRandomIntegersWithSizeNegativeSize
{
    // GIVE
    int size = -1;
    int upperBound = 1;
    
    // WHEN
    // THEN
    STAssertThrows([Random uniqueRandomIntegersWithSize:size upperBound:upperBound], @"IllegalArgumentException expected");
}

- (void)testUniqueRandomIntegersWithSizeNegativeUpperBound
{
    // GIVE
    int size = 1;
    int upperBound = -1;
    
    // WHEN
    // THEN
    STAssertThrows([Random uniqueRandomIntegersWithSize:size upperBound:upperBound], @"IllegalArgumentException expected");
}

- (void)testUniqueRandomIntegersWithSize
{
    // GIVE
    int size = 5;
    int upperBound = 5;
    
    // WHEN
    NSSet *actual = [Random uniqueRandomIntegersWithSize:size upperBound:upperBound];
    
    // THEN
    STAssertEquals(size, (int)[actual count], @"Size of set is not equal to expected");
    for (NSNumber *number in actual) {
        int currentValue = [number intValue];
        STAssertTrue((currentValue >=0 && currentValue < upperBound), @"Random value is out of expected range");
    }
}


@end

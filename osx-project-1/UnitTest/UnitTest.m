//
//  UnitTest.m
//  UnitTest
//
//  Created by Ivan Ushakov on 11/10/12.
//  Copyright (c) 2012 Ivan Ushakov. All rights reserved.
//

#import "UnitTest.h"

#import "Cell.h"
#import "Cell+Mutator.h"

@implementation UnitTest

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

- (void)testMutate
{
    Cell *a = [[Cell alloc] init];
    Cell *old = [[Cell alloc] initWithCell: a];
    
    int mutationFactor = 16;
    [a mutate: mutationFactor];
    int distance = [old hammingDistance: a];
    if (distance != mutationFactor)
    {
        STFail(@"Expected hamming distance after mutation: %d but was: %d", mutationFactor, distance);
    }
}

@end

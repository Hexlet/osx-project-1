//
//  Cell.m
//  hw1
//
//  Created by Roman Filippov on 06.11.12.
//  Copyright (c) 2012 Roman Filippov. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize DNA = _DNA;

- (id) init
{
    if (self = [super init])
    {
        _DNA = [self createNewOne];
    }
    
    return self;
}

- (NSMutableArray*) createNewOne
{
    NSMutableArray *tmp = [[[NSMutableArray alloc] initWithCapacity:100] autorelease];
    
    for (int i=0; i<100; ++i) {
        [tmp addObject:[self getSymbol]];
    }
    
    return tmp;
}

- (NSString*) getSymbol
{
    switch (arc4random()%4) {
        case 0:
            return @"A";
            break;
        case 1:
            return @"T";
            break;
        case 2:
            return @"G";
            break;
        default:
            return @"C";
            break;
    }
}

- (NSUInteger) hammingDistanceWithCell:(Cell*) cell
{
    NSUInteger count = 0;
    @try {
        for (int i=0; i<[_DNA count]; ++i) {
            if (![[_DNA objectAtIndex:i] isEqualToString: [[cell DNA] objectAtIndex:i]]) {
                ++count;
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Error: %@: %@ ",[exception name],[exception reason]);
    }
    return count;
}

- (void) dealloc
{
    [super dealloc];
}

@end

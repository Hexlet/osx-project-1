//
//  Cell.m
//  DNA
//
//  Created by Vlad on 03.11.12.
//  Copyright (c) 2012 Vlad. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA;

-(id) init
{
    self = [super init];
    if(self)
    {
        DNA = [[NSMutableArray alloc] initWithCapacity:NUMBER_OF_ELEMENTS];
        
        // Fill DNA chain
        for (int i = 0; i < NUMBER_OF_ELEMENTS; i++) {
            NSString *generatdGen = [self generateRandomGen];
            [DNA addObject:generatdGen];
            
        } //for

    } //if
    return self;
}

-(NSString *) generateRandomGen
{
    NSArray *dnaElements = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    // Generate numbers form 0 to 3
    // arc4random_uniform(max - min + 1) + min
    NSUInteger maxIndex = [dnaElements count] - 1;
    NSUInteger minIndex = 0;
    NSUInteger randomlyGeneratedGenIndex = arc4random_uniform((int)maxIndex - (int)minIndex + 1) + minIndex;
    NSString *randomGen = [dnaElements objectAtIndex:randomlyGeneratedGenIndex];
    return (NSString *)randomGen;
}

-(int) hammingDistance:(Cell *) anotherCell
{
    NSAssert(anotherCell != nil, @"The cell should be null!");
    int hammingDistance = 0;
    for (int i = 0; i < NUMBER_OF_ELEMENTS; i++) {
        if([[DNA objectAtIndex:i] isNotEqualTo:[[anotherCell DNA] objectAtIndex:i]])
        {
            hammingDistance++;
        } //if
    } //for
    return hammingDistance;
}

@end

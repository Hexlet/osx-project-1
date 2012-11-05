//
//  Cell.m
//  myDna
//
//  Created by Sergii on 10/31/12.
//  Copyright (c) 2012 Sergii. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA;

-(id) init
{
    self = [super init];
  
    // init new NSMutableArrary with default capacity
    DNA = [[NSMutableArray alloc] initWithCapacity:100];

    // and fill it with random values
    for (NSInteger i = 0; i < 100; ++i) {
        [DNA addObject: [self getRandom]];
    }
    
    return self;
}

-(id) initWithCapacity:(int)count
{
    self = [super init];
    
    // same as previous, but with customizable capacity
    DNA = [[NSMutableArray alloc] initWithCapacity:count];
    
    for (NSInteger i = 0; i < count; ++i) {
        [DNA addObject: [self getRandom]];
    }
    
    return self;
}

-(NSString*) getRandom
{
    // decalre new string with 4 default values
    NSString *randomDNA = @"ATGC";
    
    // using arc4random choose one of [randomDNA length] evements, and return it
    return [NSString stringWithFormat:@"%C", [randomDNA characterAtIndex: arc4random() % [randomDNA length]]];
}

-(void) printDNA
{
    // used for debugging purposes. just prints DNA
    NSLog(@"%@", DNA);
}

-(int) hammingDistance: (NSMutableArray*) otherDNA
{
    // initialize counter
    int counter = 0;
    
    for (NSInteger i=0; i<100; ++i) {
        // check if our array element equals otherDNA element
        
        if ([DNA objectAtIndex:i] != [otherDNA objectAtIndex:i]) {
            
            // increment counter
            ++counter;
        }
    }
    
    return counter;
}

@end

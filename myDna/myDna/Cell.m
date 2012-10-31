//
//  Cell.m
//  myDna
//
//  Created by Sergii on 10/31/12.
//  Copyright (c) 2012 Sergii. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init
{
    self = [super init];
  
    DNA = [[NSMutableArray alloc] initWithCapacity:100];
    for (NSInteger i = 0; i < 100; ++i) {
        [DNA addObject: [self getRandom]];
    }
    
    return self;
}

-(id) initWithCapacity:(int)count
{
    self = [super init];
    
    DNA = [[NSMutableArray alloc] initWithCapacity:count];
    for (NSInteger i = 0; i < count; ++i) {
        [DNA addObject: [self getRandom]];
    }
    
    return self;
}

-(NSString*) getRandom
{
    NSString *randomDNA = @"ATGC";
    return [NSString stringWithFormat:@"%C", [randomDNA characterAtIndex: arc4random() % [randomDNA length]]];
}

-(void) printDNA
{
    NSLog(@"%@", DNA);
}

-(NSMutableArray *) getDNA
{
    return DNA;
}

-(int) hammingDistance: (NSMutableArray*) otherDNA
{
    int counter = 0;
    for (NSInteger i=0; i<100; ++i) {
        if ([DNA objectAtIndex:i] == [otherDNA objectAtIndex:i]) {
            ++counter;
        }
    }
    return counter;
}

@end

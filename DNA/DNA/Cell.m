//
//  Cell.m
//  DNA
//
//  Created by Ihor Bodnar on 11/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

const int dnaSize = 100;

@implementation Cell 

@synthesize DNA = _DNA;

+(NSArray *)dnaCodes {
    static NSArray *foo = nil;
    if (foo == nil) {
        foo = [NSArray arrayWithObjects: @"A", @"T", @"G" ,@"C", nil];
    }
    return foo;
}

+(NSString *)getRandomCode {
    return [[Cell dnaCodes] objectAtIndex:arc4random()%[[Cell dnaCodes] count]];
}

+(NSString *)getRandomCode:(NSString *)exclude {
    NSString *randomValue = [[Cell dnaCodes] objectAtIndex:arc4random()%[[Cell dnaCodes] count]];
    if ([randomValue isEqualTo: exclude]) {
        randomValue = [Cell getRandomCode:exclude];
    }
    return randomValue;
}

-(id) init {
    if (self = [super init]) {
        
        _DNA = [NSMutableArray arrayWithCapacity: (dnaSize)];

        for (int i = 0; i < dnaSize; i++) {
            [_DNA insertObject:[Cell getRandomCode] atIndex:i];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)cell {
    int distance = 0;
    int i;
    
    for (i = 0; i < dnaSize; i++) {
        if ([[_DNA objectAtIndex:i] isNotEqualTo:[cell.DNA objectAtIndex:i]]) {
            distance++;
        }
    }
    return distance;
}

@end

//
//  Cell.m
//  hexlet-osx-project-1
//
//  Created by Admin on 9/11/12.
//  Copyright (c) 2012 litvak.su. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// number of elements in a cell
static const int ELEMENTS_COUNT = 100;
// DNA letters used to construct DNA code
static NSString * const dnaStrings = @"ATGC";

-(id) init {
    self = [super init];
    if (self) {
        // instantiate mutable array object
        _DNA = [NSMutableArray arrayWithCapacity:ELEMENTS_COUNT];
        // initialize array
        for (int i = 0; i < ELEMENTS_COUNT; i++) {
            [_DNA addObject: [Cell getRandomDNALetter: nil]];
        }
    }
    return self;
}

-(void) print {
    NSLog(@"%@", _DNA);
}

-(int) hammingDistance:(Cell *)aCell {
    int result = 0;
    
    for (int i = 0; i < ELEMENTS_COUNT; i++) {
        if ([self.DNA objectAtIndex:i] != [aCell.DNA objectAtIndex:i]) {
            result++;
        }
    }
    
    return result;
}

+(NSString *)getRandomDNALetter: (NSString *) excludingLetter {
    NSString* stringsToUse = dnaStrings;
    // exclude specified letter from the DNA letters string
    if (excludingLetter != nil) {
        stringsToUse = [dnaStrings stringByReplacingOccurrencesOfString: excludingLetter withString: @""];
    }
    
    int index = arc4random() % stringsToUse.length;
    return [[stringsToUse substringFromIndex:index] substringToIndex:1];
}

@end

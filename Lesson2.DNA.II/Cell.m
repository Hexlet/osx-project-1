//
//  Cell.m
//  Lesson2.DNA.II
//
//  Created by DS on 11/6/12.
//  Copyright (c) 2012 DS. All rights reserved.
//	

#import "Cell.h"

@implementation Cell {
    
}

const int dnaLength = 100;          // Length of DNA
NSArray * allowedCharsArray = NULL; // Static array of 4 allowed chars initialized only ones.

+(void)initialize {
    // Init static variable
    if (allowedCharsArray == NULL) {
        allowedCharsArray = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    }
}

-(id)init {
    self = [super init];			
    if (self) {
        // Init an empty array
        self.DNA = [NSMutableArray arrayWithCapacity:dnaLength];
        NSUInteger allowedCharsNum = [allowedCharsArray count];
        
        for (int i=0; i<=dnaLength-1; i++) {
            // Init every char as a random char
            NSUInteger charRandomIndex = arc4random_uniform(allowedCharsNum);
            [self.DNA addObject:	[allowedCharsArray objectAtIndex:charRandomIndex]];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)otherCell {
    int distance = 0;
    
    for (int i = 0; i<= [self.DNA count]-1; i++) {
        // Compare every char in the cell with other cell
        if ([self.DNA objectAtIndex:i] != [otherCell.DNA objectAtIndex:i]) {
            distance++;
        }
    }
    return distance;
}

// Returns the cell object as string
-(NSString*)asString {
    NSString* combinedString = [self.DNA componentsJoinedByString:@""];
    return combinedString;
}

@end	

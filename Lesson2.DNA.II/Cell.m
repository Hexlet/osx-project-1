//
//  Cell.m
//  Lesson2.DNA.II
//
//  Created by Администратор on 11/6/12.
//  Copyright (c) 2012 DS. All rights reserved.
//	

#import "Cell.h"

@implementation Cell {
    
}


const int dnaLength = 10;
NSArray * allowedCharsArray = NULL;

+(void)initialize {
    // Init static variable
        if (allowedCharsArray == NULL) {
            allowedCharsArray = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        }
}

-(id)init {
    self = [super init];			
    if (self) {
        
        self.DNA = [NSMutableArray arrayWithCapacity:dnaLength];
        NSUInteger allowedCharsNum = [allowedCharsArray count];
        
        for (int i=0; i<=dnaLength-1; i++) {
            NSUInteger charRandomIndex = arc4random_uniform(allowedCharsNum);
            [self.DNA addObject:	[allowedCharsArray objectAtIndex:charRandomIndex]];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)otherCell {
    int distance = 0;
    
    for (int i = 0; i<= [self.DNA count]-1; i++) {
        if ([self.DNA objectAtIndex:i] != [otherCell.DNA objectAtIndex:i]) {
            distance++;
        }
    }
    return distance;
}

-(NSString*)asString {
    NSString* combinedString = [self.DNA componentsJoinedByString:@""];
    return combinedString;
}
@end	

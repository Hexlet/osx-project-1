//
//  Cell.m
//  AssingmentDNA;
//
//  Created by LEV on 30.10.12.
//  Copyright (c) 2012 LEV. All rights reserved.
//

#import "Cell.h"

@implementation Cell
{
    NSUInteger capacity;
}

-(id) init {
    //call init from NSObject
    self = [super init];
    
    //initialize random variables
    int random = 0;
    unichar random_char;
    
    //initialize NSString and NSMurableArray objects
    capacity = 100;
    _genes = [[NSString class] stringWithString:@"ATGC"];
    _DNA = [[NSMutableArray class] arrayWithCapacity:capacity];
    
    //fill DNA array with random characters from genes 
    for (int i=0; i<capacity; i++) {
        random = arc4random() % [_genes length];
        random_char = [_genes characterAtIndex:random];
        [_DNA addObject:[[NSString class] stringWithCharacters:&(random_char) length:1]];
    }
    
    return self;
}

-(int) hammingDistance:(Cell *)secondCell {
    //initialize difference variable
    int difference = 0;
    
    //count differences between two DNA from this cell and secondCell
    for (int i=0; i<capacity; i++) {
        if ([_DNA objectAtIndex:i]!=[[secondCell DNA] objectAtIndex:i]) {
            ++difference;
        }
    }
    
    return difference;
}


@end

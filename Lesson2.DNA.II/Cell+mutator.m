//
//  Cell+mutator.m
//  Lesson2.DNA.II
//
//  Created by DS on 11/10/12.
//  Copyright (c) 2012 DS. All rights reserved.
//

#import "Cell+mutator.h"
#import "Cell.h"

@implementation Cell (mutator)

// Mutates a single given char into a random one.
-(NSString*)charMutation:(NSString*)oldChar {
    NSString* newChar = @"";
    int allowed = [allowedCharsArray count];
    int randAllowedCharIndex;
    do {
        randAllowedCharIndex = arc4random_uniform(allowed);
        newChar = [allowedCharsArray objectAtIndex:randAllowedCharIndex];
    } while (newChar == oldChar); // Re-try to get a new char if it equals to an input char (probability is only 25%)
    return newChar;
}

// Mutates exactly given percent of chars in the cell
-(void)mutate:(int)percent {
    
    // Temp	array of indices: 0, 1, 2,...,99
    NSMutableArray *indexArray = [NSMutableArray arrayWithCapacity:[self.DNA count]];
    for (int i=0; i<=[self.DNA count]-1; i++) {
        [indexArray addObject:[NSNumber numberWithInt:i]];
    }
    
    NSUInteger charIndex;
    // Repeat mutation exactly (100* percent/100) times
    for (int i = 1; i<=[self.DNA count]*percent/100; i++) {
        // Get a random index in the temp array of indices (not from DNA directly!)
        NSUInteger randomIndex = arc4random_uniform([indexArray count]);
        // Now get an index in the DNA array
        charIndex = [[indexArray objectAtIndex:randomIndex] intValue];
        // Remove the used index from the temp array of indices
        [indexArray removeObjectAtIndex:randomIndex];
 
        // Now get a char from DNA array
        NSString* originChar = [self.DNA objectAtIndex:charIndex];
        // Get a mutated char
        NSString* mutatedChar = [self charMutation:originChar];
        // Replace origin char by mutated char
        [self.DNA replaceObjectAtIndex:charIndex withObject:mutatedChar];
    }
}



@end

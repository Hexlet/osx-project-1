//
//  Cell+mutator.m
//  Lesson2.DNA.II
//
//  Created by Администратор on 11/10/12.
//  Copyright (c) 2012 DS. All rights reserved.
//

#import "Cell+mutator.h"
#import "Cell.h"

@implementation Cell (mutator)

-(NSString*)charMutation:(NSString*)oldChar {
    NSString* newChar = @"";
    int allowed = [allowedCharsArray count];
    int randAllowedCharIndex;//  = arc4random_uniform(allowed);
    do {
        randAllowedCharIndex = arc4random_uniform(allowed);
        newChar = [allowedCharsArray objectAtIndex:randAllowedCharIndex];
    } while (newChar == oldChar);
    return newChar;
}

-(void)mutate:(int)percent {
    	
    NSMutableArray *indexArray = [NSMutableArray arrayWithCapacity:[self.DNA count]];
    for (int i=0; i<=[self.DNA count]-1; i++) {
        [indexArray addObject:[NSNumber numberWithInt:i]];
    }
    
    NSUInteger charIndex;
    for (int i = 1; i<=[self.DNA count]*percent/100; i++) {
        NSUInteger randomIndex = arc4random_uniform([indexArray count]);
        charIndex = [[indexArray objectAtIndex:randomIndex] intValue];
        [indexArray removeObjectAtIndex:randomIndex];
 
        NSString* originChar = [self.DNA objectAtIndex:charIndex];
        NSString* mutatedChar = [self charMutation:originChar];
        [self.DNA replaceObjectAtIndex:charIndex withObject:mutatedChar];
    }
}



@end

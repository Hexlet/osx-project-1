//
//  Cell+Mutator.m
//  DNA
//
//  Created by user on 11/7/12.
//  Copyright (c) 2012 azhohov. All rights reserved.
//

#import "Cell+Mutator.h"
#import "DNAFactory.h"

@implementation Cell (Mutator)

//get M random integers from range
//The Knuth algorithm
//http://stackoverflow.com/questions/1608181/unique-random-numbers-in-an-integer-array-in-the-c-programming-language/1608585#1608585
- (void)mutate:(int)percent
{
    NSParameterAssert(percent >= 0 && percent <= 100);
    
    NSUInteger dnaLength = [self.DNA count];
    NSUInteger countToChange = round(dnaLength * percent / 100.0);
    
    int iM = 0;
    
    for(int iN = 0; iN < dnaLength && iM < countToChange; iN++)
    {
        NSUInteger rN = dnaLength - iN;
        NSUInteger rM = countToChange - iM;
        
        if (arc4random() % rN < rM)
        {
            
            NSString *oldValue = (NSString *)[self.DNA objectAtIndex:iN];
            NSString *newValue = [DNAFactory getRandomDNABaseExclude:oldValue];
            [self.DNA replaceObjectAtIndex:iN withObject:newValue];

            iM++;
        }
    }
    
    NSAssert(iM == countToChange, @"Not enough changes");
}

@end

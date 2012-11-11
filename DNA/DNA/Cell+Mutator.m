//
//  Cell+Mutator.m
//  DNA
//
//  Created by sx on 11.11.12.
//  Copyright (c) 2012 sx. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate: (int) size
{
    if(DNA_SIZE < size){ size = DNA_SIZE; }
    if(0 > size){ size = 0; }
    
    int mutatedPositions[size];
    int rndpos;
    BOOL hasInMutatedPositions;
    NSString* oldValue;
    NSString* newValue;
    
    while (size)
    {
        rndpos = [self getRandomNumber:0 to:DNA_SIZE-1];
        hasInMutatedPositions = NO;
        
        for(int i=0; i<size; ++i)
        {
            if(rndpos == mutatedPositions[i]){
                hasInMutatedPositions = YES;
                break;
            }
        }
        
        if(!hasInMutatedPositions)
        {
            oldValue = [self.DNA objectAtIndex:rndpos];

            do {
                newValue = [self getRandomChar];
            } while ([oldValue isEqual:newValue]);
            
            [[self DNA] setObject:newValue atIndexedSubscript:rndpos];
            mutatedPositions[--size] = rndpos;
            //size--;
        }
        
        //NSLog(@"%@ %@ %i", oldValue, newValue, rndpos);
    }
}

@end

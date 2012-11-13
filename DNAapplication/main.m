//
//  main.m
//  DNAapplication
//
//  Created by Admin on 11/9/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Utils.h"

@interface Cell (Mutator)

-(void) mutate: (int)percent;

@end

@implementation Cell (Mutator)

-(void) mutate: (int)percent
{
    float multiplier = (float)percent / 100;
    int numElementsToChange = floor((float)[[self dna] count] * multiplier);

    NSMutableArray *mutatedElementsIDs = [Utils getRandom:numElementsToChange numbersOutOf:(int)[[self dna] count]];
    
    
    for (NSUInteger i = 0; i < numElementsToChange; i++)
    {

        NSUInteger replaceIndex = (NSUInteger)[[mutatedElementsIDs objectAtIndex:i] integerValue];
        NSString *objectToReplaceWith = [Utils getRandomComponent:[self components]];
        
        //ensure that dna element changes to some other component but not the same
        while ([[self dna] objectAtIndex:replaceIndex] == objectToReplaceWith)
        {
            objectToReplaceWith = [Utils getRandomComponent:[self components]];
        }
        
        [[self dna] replaceObjectAtIndex:replaceIndex withObject:objectToReplaceWith];
    }

}

@end


int main(int argc, const char * argv[])
{
    int mutationPercent = 10;
    
    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc ] init];
        Cell *cell2 = [[Cell alloc ] init];
        
        [cell1 print];
        [cell2 print];
        
        int hDistanceBefore = [cell1 hammingDistance:cell2];
        
        NSLog(@"hamming distance %i", hDistanceBefore);
        
        [cell1 mutate:mutationPercent];
        [cell2 mutate:mutationPercent];
        
        [cell1 print];
        [cell2 print];
        
        int hDistanceAfter = [cell1 hammingDistance:cell2];
        
        NSLog(@"hamming distance %i", hDistanceAfter);
        
    }
    return 0;
}


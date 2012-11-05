//
//  main.m
//  DNA
//
//  Created by Andrey Shemanovskiy on 05.11.12.
//  Copyright (c) 2012 andrey.shemanovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
- (void)mutate:(int)numberForMutation;
@end

@implementation Cell (mutator)

- (void)mutate:(int)numberForMutation
{
    if (numberForMutation == 0) return;
    if (numberForMutation > 100) numberForMutation = 100;
        
    //create array for shuffle
    
    NSMutableArray *shuffleArray = [[NSMutableArray alloc] initWithCapacity:100];
    for (int i = 0; i < 100; i++)
    {
        [shuffleArray addObject:[NSNumber numberWithInt:i]];
    }
    
    //shuffle created array
    
    for (int i = 0; i < [shuffleArray count]; i++)
    {
        int randomNumber = arc4random() % [shuffleArray count];
        [shuffleArray exchangeObjectAtIndex:i withObjectAtIndex:randomNumber];
        
    }
    
    //mutate array
    
    for (int i = 0; i < numberForMutation; i++)
    {
        int randomIndex = [[shuffleArray objectAtIndex:i] intValue];
        NSString *codon = [[self dna] objectAtIndex:randomIndex];
        
        // get random codon
        
        int randomMember = arc4random() % 4;
        NSString *newCodon = [[self codonArray] objectAtIndex:randomMember];
        
        // if old and new codons are equals, try to regenerate
        
        while ([codon isEqualToString:newCodon]) {
            int randomMember = arc4random() % 4;
            newCodon = [[self codonArray] objectAtIndex:randomMember];
        }
        
        // replace old codon with new one
        
        [[self dna] replaceObjectAtIndex:randomIndex withObject:newCodon];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *dnaCell1 = [[Cell alloc] init];
        Cell *dnaCell2 = [[Cell alloc] init];
        
        int hammingDistanceForTwoCells;
        hammingDistanceForTwoCells = [dnaCell1 hammingDistance:dnaCell2];
        
        NSLog(@"Hamming distance is %d", hammingDistanceForTwoCells);
        
        [dnaCell1 mutate:43];
        [dnaCell1 mutate:43];
        
        int newHammingDistanceForTwoCells;
        newHammingDistanceForTwoCells = [dnaCell1 hammingDistance:dnaCell2];
        
        NSLog(@"New hamming distance is %d", newHammingDistanceForTwoCells);
    }
    return 0;
}


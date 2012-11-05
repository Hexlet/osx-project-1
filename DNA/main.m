//
//  main.m
//  DNA
//
//  Created by Sergey Mitskevich on 11/4/12.
//  Copyright (c) 2012 Sergey Mitskevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface NSMutableArray (Shuffling)
- (void)shuffle;
@end

@implementation NSMutableArray (Shuffling)

// Taken from http://stackoverflow.com/questions/56648/whats-the-best-way-to-shuffle-an-nsmutablearray
- (void) shuffle {
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end


@interface Cell (Mutator)
- (void) mutate: (int) amount;
@end

@implementation Cell (Mutator)

- (void) mutate: (int) percentage {
    // Calculating the number of items we have to change.
    int itemsNum = round(DNALength * percentage / 100.0);
    
    // Creating an array of numbers 0 to 100 (length of our DNA)
    NSMutableArray *range = [[NSMutableArray alloc] initWithCapacity:DNALength];
    for (int i = 0; i < DNALength; i++)
        [range addObject:[NSNumber numberWithInt:i]];
    
    // Shuffling the range of numbers
    [range shuffle];
    
    // Replacing items in our DNA by taking indexes from our shuffled range
    int position;
    for (int i = 0; i < itemsNum; i++) {
        position = [[range objectAtIndex:i] intValue];
        NSString *itemValue = [self.DNA objectAtIndex: position];
        [self.DNA replaceObjectAtIndex: position
                  withObject: [self getRandomDNAItemValueExcept:itemValue]];
    }
}

@end


int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init];
        NSLog(@"cell1:");
        [cell1 logDNA];
        cell2 = [[Cell alloc] init];
        NSLog(@"cell2:");
        [cell2 logDNA];
        
        NSLog(@"Hamming distance: %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:50];
        NSLog(@"Mutated cell1:");
        [cell1 logDNA];
        NSLog(@"Hamming distance: %i", [cell1 hammingDistance:cell2]);

        [cell2 mutate:50];
        NSLog(@"Mutated cell2:");
        [cell2 logDNA];
        NSLog(@"Hamming distance: %i", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}


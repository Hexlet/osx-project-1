//
//  main.m
//  DNA
//
//  Created by Dm on 10/30/12.
//  Copyright (c) 2012 Dm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface NSMutableArray (Shuffling)
- (void)shuffle;
@end

@implementation NSMutableArray (Shuffling)

- (void)shuffle
{
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end

@interface Cell (mutator)
-(void) mutate:(int)viruses;
@end

@implementation Cell (mutator)
-(void) mutate:(int)viruses {
    
    NSMutableArray *viruseBase = [[NSMutableArray alloc] init];
    
    //fill viruseBase
    for (int i = 0; i < viruses; i++) {
        NSNumber *virusNumber = [[NSNumber alloc] initWithInteger:i];
        [viruseBase addObject:virusNumber];
    }
    //shuffle viruseBase
    [viruseBase shuffle];
    
    for (int i = 0; i < [viruseBase count]; i++) {
        [
         [self dna]
            replaceObjectAtIndex:[[viruseBase objectAtIndex:i] intValue]
            withObject:[[self nucleobase] objectAtIndex:arc4random() % [[self nucleobase] count]]
         ];
    }
    
}
@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Hamming Distance Between DNAs is %i",[cell1 hammingDistance:cell2]);
        [cell1 mutate:5];
        [cell2 mutate:100];
        NSLog(@"Hamming Distance Between Mutated DNAs is %i",[cell1 hammingDistance:cell2]);
    }
    return 0;
}


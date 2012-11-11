//
//  main.m
//  osx-project-1
//
//  Created by Alex on 31.10.12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
    - (void) mutate:(int) val;
@end

@implementation Cell (mutator)

- (void) mutate: (int) val {
    NSCAssert((val >= 0 && val <= 100), @"Invalid x value for mutating!");

    NSMutableArray *indexForChange = [NSMutableArray arrayWithCapacity:CAPACITY];
    
    for (int i = 0; i < CAPACITY; i++) {
        [indexForChange insertObject: [NSNumber numberWithInt:i] atIndex:i];
    }
    
    //shuffle array: via http://stackoverflow.com/questions/56648/whats-the-best-way-to-shuffle-an-nsmutablearray
    
    NSUInteger count = CAPACITY;
    for (NSUInteger i = 0; i < count; ++i) {
        
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [indexForChange exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
    int countsForChange = (int) lroundf((CAPACITY * val) / 100.0f);
    
    for (int i = 0; i < countsForChange; i++) {
        int randIndex = (int) [[indexForChange objectAtIndex:i] integerValue];        
        NSString *newVal = [self getRandomValueExcept:[[self dna] objectAtIndex:randIndex]];
        [[self dna] replaceObjectAtIndex:randIndex withObject:newVal];
    }
    
}

- (NSString*) getRandomValueExcept: (NSString*) val {
    NSMutableArray *values = [NSMutableArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
    [values removeObject:val];
    int randIndex = arc4random() % [values count];
    
    return [values objectAtIndex:randIndex];
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"Distance is %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:2];
        [cell2 mutate:3];

        NSLog(@"Distance after mutate is %i", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


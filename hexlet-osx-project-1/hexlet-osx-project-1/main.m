//
//  main.m
//  hexlet-osx-project-1
//
//  Created by Admin on 9/11/12.
//  Copyright (c) 2012 litvak.su. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void) mutate: (int) percent;

@end

@implementation Cell (mutator)

-(void) mutate:(int)percent {
    // instantiate array of indices
    NSMutableArray *indices = [NSMutableArray arrayWithCapacity:[self.DNA count]];
    for (int i = 0; i < self.DNA.count; i++) {
        [indices addObject:[NSNumber numberWithInt:i]];
    }
    
    // calculate how much elements will be mutated
    int mutationsCount = (percent * self.DNA.count) / 100;
    for (int i = 0; i < mutationsCount; i++) {
        // find next random index
        int nextIndexOfIndex = arc4random() % indices.count;
        // find index in DNA array
        NSNumber *indexInDNAarray = [indices objectAtIndex:nextIndexOfIndex];
        // mutate!
        [self.DNA setObject: [Cell getRandomDNALetter] atIndexedSubscript:[indexInDNAarray integerValue]];
        // remove mutated index
        [indices removeObjectAtIndex:nextIndexOfIndex];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // instantiate cells
        Cell *c1 = [[Cell alloc] init];
        Cell *c2 = [[Cell alloc] init ];
        
        // calculate hamming distance and print it
        NSLog(@"Hamming distance is %i", [c1 hammingDistance:c2]);
        
        // mutate
        const int MUTATION_PERCENT = 25;
        [c1 mutate:MUTATION_PERCENT];
        // calculate hamming distance and print it
        NSLog(@"Hamming distance is %i after %i percent mutation", [c1 hammingDistance:c2], MUTATION_PERCENT);
    }
    return 0;
}


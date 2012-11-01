//
//  main.m
//  DNA
//
//  Created by Dm on 10/30/12.
//  Copyright (c) 2012 Dm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate:(int)x;
@end

@implementation Cell (mutator)
-(void) mutate:(int)x {
    
    NSMutableArray *xArray = [[NSMutableArray alloc] init];
    
    while ([xArray count] < x) {
        //create random number object from 0 to 100 (dna array length)
        NSNumber *rand = [NSNumber numberWithInteger:arc4random() % [[self dna] count] ];
        //check the xArray rand object uniqueness
        if (![xArray containsObject:rand]) {
            //add rand number to xArray
            [xArray addObject:rand];
        }
    }
    
    for (int i = 0; i < [xArray count]; i++) {
        //replace objects in dna with random nucleobases from nucleobases array, random indexes are taken from xArray
        [
         [self dna]
            replaceObjectAtIndex:[[xArray objectAtIndex:i] intValue]
            withObject:[[self nucleobases] objectAtIndex:arc4random() % [[self nucleobases] count]]
         ];
    }
//    NSLog(@"_dna %@",[self dna]);
}
@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Hamming Distance Between DNAs is %i",[cell1 hammingDistance:cell2]);
        [cell1 mutate:5];
        [cell2 mutate:50];
        NSLog(@"Hamming Distance Between Mutated DNAs is %i",[cell1 hammingDistance:cell2]);
    }
    return 0;
}


//
//  main.m
//  DNAHomeTask
//
//  Created by Andrei Tsukanov on 11/2/12.
//  Copyright (c) 2012 Andrei Tsukanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
-(void)mutate:(int)percent;

@end

@implementation Cell (Mutator)
-(void)mutate:(int)percent
{
    //exam input args
    if (percent > 100 || percent < 0)
    {
        NSLog(@"percent must be in range 0..100");
        return;
    }
    
    // init array with index from 0 to 99.
    NSMutableArray* mutatePlaces = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 100; i++)
        [mutatePlaces addObject:[NSNumber numberWithInteger:i]];
    
    // remove from array random indexes which not needed to mutate,
    // keep indexes neccesary to mutate
    for (NSInteger i = 0; i < 100 - percent; i++)
        [mutatePlaces removeObjectAtIndex: rand() % mutatePlaces.count];
    
    // for each index change corresponding element in DNA array
    for (NSInteger i = 0; i < mutatePlaces.count; i++)
        [self setRandomElementAtIndex:[[mutatePlaces objectAtIndex: i] integerValue]];
}


@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell0, *cell1;
        cell0 = [[Cell alloc] init];
        cell1 = [[Cell alloc] init];
        NSLog(@"Hamming distance before mutate : %i", [cell0 hammingDistance:cell1]);
        [cell0 mutate:arc4random() % 100];
        [cell1 mutate:arc4random() % 100];
        NSLog(@"Hamming distance after mutate : %i", [cell0 hammingDistance:cell1]);
        
    }
    return 0;
}


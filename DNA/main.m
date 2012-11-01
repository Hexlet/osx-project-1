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
-(void) mutate:(int)viruses;
@end

@implementation Cell (mutator)
-(void) mutate:(int)viruses {
    
    NSMutableArray *viruseBase = [[NSMutableArray alloc] init];
    
    while ([viruseBase count] < viruses) {
        NSNumber *randomVirusNumber = [NSNumber numberWithInteger:arc4random() % [[self dna] count] ];
        if (![viruseBase containsObject:randomVirusNumber]) {
            [viruseBase addObject:randomVirusNumber];
        }
    }
    
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
        [cell2 mutate:50];
        NSLog(@"Hamming Distance Between Mutated DNAs is %i",[cell1 hammingDistance:cell2]);
    }
    return 0;
}


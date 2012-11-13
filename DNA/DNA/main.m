//
//  main.m
//  DNA
//
//  Created by Mac on 11/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void) mutate: (int) percent;

@end

@implementation Cell (mutator)


-(void)mutate:(int)percent {
    if (percent < 0 || percent > 100) {
        NSLog(@"Percent to mutate should be between 0 and 100");
        return;
    }
    
    int count = DNA_SIZE * percent / 100;
    NSMutableArray *indexArray = [NSMutableArray arrayWithCapacity:DNA_SIZE];
    for (int i = 0; i < DNA_SIZE; i++) {
        [indexArray addObject: [NSNumber numberWithInt: i]];
    }
    
    for (int i = 0; i < count; i++) {
        int randomIndex = arc4random_uniform([indexArray count]);
        int indexToMutate = [[indexArray objectAtIndex:randomIndex] intValue];
        NSString *newNucleotide;
        do {
            newNucleotide = [Cell getRandomNucleotide];
        } while ([newNucleotide isEqualTo: [DNA objectAtIndex: indexToMutate]]);
        [DNA replaceObjectAtIndex:indexToMutate withObject:newNucleotide];
        [indexArray removeObjectAtIndex:randomIndex];
    }
}

@end


int main (int argc, const char * argv[])
{

    @autoreleasepool {
        // create two Cell objects
        Cell *cell1 = [[Cell alloc] init];        
        //[cell1 printDNA];        
        Cell *cell2 = [[Cell alloc] init];
        //[cell2 printDNA];
        
        // calculate hamming distance between them and print result
        int hammingDistance = [cell1 hammingDistance:cell2];
        NSLog(@"Hamming distance between cell1 and cell2 equals %i", hammingDistance);
               
        // mutate both
        [cell1 mutate:50];
        //[cell1 printDNA]; 
        [cell2 mutate:70];
        //[cell2 printDNA]; 
        
        // calclulate hamming distance again and print result
        hammingDistance = [cell1 hammingDistance:cell2];
        NSLog(@"Hamming distance between cell1 and cell2 after mutate equals %i", hammingDistance);        
    }
    return 0;
}


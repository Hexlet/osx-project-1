//
//  Cell+Mutator.m
//  osx-project-1
//
//  Created by Andrew Kolisnichenko on 11/4/12.
//  Copyright (c) 2012 Andrew Kolisnichenko. All rights reserved.
//

#import "Cell+Mutator.h"
#import "Cell.h"

@implementation Cell (Mutator)

-(void)mutate:(int)percentOfNucleotides{
    if(percentOfNucleotides > 100 || percentOfNucleotides < 0){
        NSLog(@"Incorrect percet is set for mutation");
        return;
    }
    // get number of changes
    int numberOfMutatedNucleotides = (int)[[self dna] count] * percentOfNucleotides/100;
    // get array of random unrepeatable position in dna according to percent of mutation
    
    NSMutableArray* mutationPositions = [NSMutableArray arrayWithCapacity:numberOfMutatedNucleotides];
    int currentIndex = 0;
    while (currentIndex < numberOfMutatedNucleotides){
        int mutationPosition = arc4random() % [[self dna] count];
        NSNumber* position = [NSNumber numberWithInt:mutationPosition];
        if (currentIndex < numberOfMutatedNucleotides && ![mutationPositions containsObject:position]){
            [mutationPositions insertObject:position atIndex:currentIndex];
            currentIndex++;
        }
    }
    
    // change dna nucleotide by newly generated value
    for (NSNumber* index in mutationPositions){
        NSString* previousValue = [[self dna] objectAtIndex:[index intValue]];
        NSString* generatedValue = [Cell getRandomDNANucleotide];
        while([previousValue isEqualToString:generatedValue]){
            generatedValue = [Cell getRandomDNANucleotide];
        }
        [[self dna] replaceObjectAtIndex:[index intValue] withObject:generatedValue];
    }
}
@end

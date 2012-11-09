//
//  main.m
//  DNA Mutabling
//
//  Created by Artem Aminov on 11/8/12.
//  Copyright (c) 2012 Artem Aminov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void)mutate:(int)percentToMutate;

@end

@implementation Cell (mutator)

-(void)mutate:(int)percentToMutate {
	NSMutableArray *mutatedNucleotids = [NSMutableArray array];
	
	int nucleotidsCount = [self nucleotidsCount];
	int countToMutate = nucleotidsCount * percentToMutate / 100;
	for (int i = 0; i < countToMutate; i++) {
		while ([mutatedNucleotids count] < countToMutate) {
			int g = arc4random() % nucleotidsCount;
			if (![mutatedNucleotids containsObject:[NSNumber numberWithInt:g]]) {
				[mutatedNucleotids addObject:[NSNumber numberWithInt:g]];
				int r = arc4random() % 4;
				[[self DNA] replaceObjectAtIndex:g withObject:[self nucleotids][r]];
			}
		}
	}
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
		int nucleotidsCount = 100;
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init:nucleotidsCount];
		cell2 = [[Cell alloc] init:nucleotidsCount];
        NSLog(@"hamming distance of cell1 with cell2 dna's: %i", [cell1 hammingDistance:cell2]);
		
		int percentToMutate = 10;
		[cell1 mutate:percentToMutate];
		[cell2 mutate:percentToMutate];
        NSLog(@"hamming distance of mutated cell1 and cell2 dna's: %i", [cell1 hammingDistance:cell2]);
    }
    return 0;
}
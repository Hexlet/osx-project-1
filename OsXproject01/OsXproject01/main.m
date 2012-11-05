//
//  main.m
//  OsXproject01
//
//  Created by John Smith on 11/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutatorCategory)

- (void)mutator: (int)percentageOfSymbolsToMutate;

@end

@implementation Cell (mutatorCategory)

- (void)mutator: (int)percentageOfSymbolsToMutate{
    if ((percentageOfSymbolsToMutate >= 0)&&(percentageOfSymbolsToMutate<=100)) { //checking if percentage is correct
        int numberOfSymbolsToMutate = (CELLSIZE * percentageOfSymbolsToMutate)/100;
        NSMutableSet *mutatedObjectSet = [[NSMutableSet alloc] init]; // set to store unique indexes of mutated symbols
        while (numberOfSymbolsToMutate > 0) {
            NSNumber *indexOfSymbolToMutate = [NSNumber numberWithInt:arc4random_uniform(CELLSIZE)]; //picking random index
            if (![mutatedObjectSet containsObject:indexOfSymbolToMutate]) {
                //implementing mutation
                NSMutableArray *nucleoBaseArray = [NSMutableArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
                NSString *nucleoBase = [self.DNA objectAtIndex:[indexOfSymbolToMutate intValue]]; //current symbol
                [nucleoBaseArray removeObject:nucleoBase]; //removing current symbol from available array
                int randomSymbol = arc4random_uniform([nucleoBaseArray count]); //picking new symbol from remaining
                [self.DNA replaceObjectAtIndex:[indexOfSymbolToMutate intValue] 
                                    withObject:[nucleoBaseArray objectAtIndex:randomSymbol]]; //replacing symbol
                //end of implementation
                [mutatedObjectSet addObject:indexOfSymbolToMutate];
                numberOfSymbolsToMutate--;
            }
            
        }
        
    }else {
        NSLog(@"Percent value is out of range");
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell01 = [[Cell alloc] init];
        Cell *cell02 = [[Cell alloc] init];
        NSLog(@"Hamming distance between cells: %i", [cell01 hammingDistance:cell02]);
        [cell01 mutator:30];
        [cell02 mutator:20];
        NSLog(@"Hamming distance between cells: %i", [cell01 hammingDistance:cell02]);
        
    }
    return 0;
}


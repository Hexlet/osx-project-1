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
            NSNumber *index = [NSNumber numberWithInt:arc4random_uniform(CELLSIZE)]; //picking random index
            if (![mutatedObjectSet containsObject:index]){  
                [mutatedObjectSet addObject:index];
                numberOfSymbolsToMutate--;
            }
        }
        
        for (NSNumber *index in mutatedObjectSet){
            NSMutableArray *baseArray = [nucleoBaseArray mutableCopy];
            NSString *nucleoBase = [self.DNA objectAtIndex:[index intValue]]; //current symbol
            [baseArray removeObject:nucleoBase]; //removing current symbol from available array
            int randomSymbol = arc4random_uniform([baseArray count]); //picking new symbol from remaining
            [self.DNA replaceObjectAtIndex:[index intValue] 
                                withObject:[baseArray objectAtIndex:randomSymbol]]; //replacing symbol
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
        NSLog(@"New Hamming distance between cells: %i", [cell01 hammingDistance:cell02]);
        
    }
    return 0;
}


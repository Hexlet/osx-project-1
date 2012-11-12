//
//  main.m
//  DNA
//
//  Created by Vladimir Tsyganov on 01.11.12.
//  Copyright (c) 2012 Vladimir Tsyganov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
    -(void)mutate:(int)persent;

@end
@implementation Cell (mutator)

-(void)mutate:(int)persent{
    NSMutableIndexSet *changedGens = [[NSMutableIndexSet alloc] init];
    int countOfChangedGens = 0, curentIndex = 0;
    NSString *randomGen;
    while (countOfChangedGens < round((double)sizeOfDna/100*persent)) {
        srandom((unsigned)time(NULL)+rand());
        curentIndex = 0+random()%sizeOfDna;
        if (![changedGens containsIndex:curentIndex]) {
            randomGen = [self getRandomGen];
            
            while (randomGen == [self.dna objectAtIndex: curentIndex]) {
                randomGen = [self getRandomGen];
            }
            
            [changedGens addIndex:curentIndex];
            [self.dna replaceObjectAtIndex:curentIndex withObject:randomGen];
            countOfChangedGens++;
        }
    }
}

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *firstCell, *secondCell;
        firstCell = [[Cell alloc] init];
        secondCell = [[Cell alloc] init];
        
        NSLog(@"%d",[firstCell hammingDistance:secondCell]);
        
        [firstCell mutate:20];
        [secondCell mutate:85];
        
        NSLog(@"%d",[firstCell hammingDistance:secondCell]);
    }
    return 0;
}


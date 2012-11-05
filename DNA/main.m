//
//  main.c
//  DNI
//
//  Created by Qik on 11/4/12.
//  Copyright (c) 2012 Qik. All rights reserved.
//

#include <Foundation/Foundation.h>
#include "Cell.h"

@interface Cell(Mutator)
-(void)mutate:(int) percent;
@end

@implementation Cell(Mutator)
-(void)mutate:(int)percent{
    if(percent > 100){
        [NSException raise:@"Percent can't be > 100" format:@"Percent can't be > 100"];
    }
    NSMutableArray *visited = [NSMutableArray arrayWithCapacity:[[self dna] count]];
    NSMutableArray *dna = [self dna];
    int size =(int) [dna count];
    for(int i = 0; i < percent; i++){
        NSNumber *randomElement = [NSNumber numberWithInt:arc4random_uniform(size)];
        while([visited containsObject:randomElement]){
            randomElement = [NSNumber numberWithInt:arc4random_uniform(size)];
        }
        [visited addObject:randomElement];
        [dna setObject:[self getRandomNucleotid] atIndexedSubscript:[randomElement intValue]];
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool{
        NSLog(@"%d", arc4random_uniform(4));
        Cell *cell;
        cell = [[Cell alloc] init];
        
        Cell *cell2;
        cell2 = [[Cell alloc] init];
        
        
        NSLog(@"Before mutation");
        
        
        NSLog(@"cell and cell2 hamming distance = %d", [cell hammingDistance:cell2]);
        
        Cell *cell3 = [cell copy];
        
        NSLog(@"cell and cell3 hamming distance = %d", [cell hammingDistance:cell3]);
        
        [cell mutate:55];
        [cell2 mutate:20];
        
        NSLog(@"After mutation");
        
        NSLog(@"cell and cell2 hamming distance = %d", [cell hammingDistance:cell2]);
        NSLog(@"cell and cell3 Hamming distance = %d", [cell hammingDistance:cell3]);
        
    }
}


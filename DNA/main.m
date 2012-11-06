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
    NSMutableArray *dna = [self dna];
    NSMutableArray *visited = [NSMutableArray arrayWithCapacity:[dna count]];
    int size =(int) [dna count];
    int update_number = round(((percent * [dna count])/100));
    for(int i = 0; i < update_number; i++){
        NSNumber *randomElement = [NSNumber numberWithInt:arc4random_uniform(size)];
        while([visited containsObject:randomElement]){
            randomElement = [NSNumber numberWithInt:arc4random_uniform(size)];
        }
        [visited addObject:randomElement];
        NSString *currentNucl = [dna objectAtIndex:[randomElement intValue]];
        NSString *newNucl = [self getRandomNucleotid];
        while ([currentNucl isEqualToString:newNucl]){
            newNucl = [self getRandomNucleotid];
        }
        
        [dna setObject:newNucl atIndexedSubscript:[randomElement intValue]];
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


//
//  main.m
//  hexlet-project1
//
//  Created by Alexey Karguine on 01.11.12.
//  Copyright (c) 2012 Alexey Karguine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#include <stdlib.h>

@interface Cell (mutator)
-(void)mutate:(int)p;
@end

@implementation Cell (mutator)
-(void)mutate: (int)percent {

    int qnt = DNALength * percent / 100; //Количество элементов для замены
    
    NSMutableArray *idx; 
    idx = [[NSMutableArray alloc] initWithCapacity:[self.dna count]];
    for (int i = 0; i < [self.dna count]; i++) [idx addObject:[NSNumber numberWithInt:i]];
    
    NSMutableArray *shuffle; // Создается массив случайных индексов для замены
    shuffle = [[NSMutableArray alloc] initWithCapacity:qnt];
    for  (int i = 0; i < qnt; i++) {
        int index = arc4random() % [idx count];
        [shuffle addObject:[idx objectAtIndex:index]];
        [idx removeObjectAtIndex:index];
    }
    
    for (id obj in shuffle) {
        [self.dna replaceObjectAtIndex:[obj intValue] withObject:[self.alphabet objectAtIndex:arc4random() % [self.alphabet count]]];
    }
        
    return;
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        NSLog(@"%i",[cell1 hammingDistance:cell2]);
        
        [cell1 mutate:53];
        [cell2 mutate:13];
        
        NSLog(@"%i",[cell1 hammingDistance:cell2]);

        
    }
    return 0;
}


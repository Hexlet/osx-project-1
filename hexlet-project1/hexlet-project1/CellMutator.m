//
//  CellMutator.m
//  hexlet-project1
//
//  Created by Alexey Karguine on 02.11.12.
//  Copyright (c) 2012 Alexey Karguine. All rights reserved.
//

#import "CellMutator.h"
#import "Cell.h"

@implementation Cell (mutator)
-(void)mutate: (int)percent {
    
    if (percent > 100 && percent <= 0) return; // Если передали 0, то делать ничего не нужно.
    int qnt = DNALength * percent / 100; // Количество элементов для замены
    
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

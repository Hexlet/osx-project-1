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
    
    // Массив индексов
    NSMutableArray *idx;
    idx = [[NSMutableArray alloc] initWithCapacity:[self.dna count]];
    for (int i = 0; i < [self.dna count]; i++) [idx addObject:[NSNumber numberWithInt:i]];
    
    for  (int i = 0; i < qnt; i++) {
        int index = arc4random() % [idx count];
        NSString *previous = [self.dna objectAtIndex:index];
        NSString *next = [self getRandomSymbol];
        while ([previous isEqualToString:next]) {
            next = [self getRandomSymbol];
        }
        [self.dna replaceObjectAtIndex:[[idx objectAtIndex:index] intValue] withObject:next];
        [idx removeObjectAtIndex:index];
    }
    
    return;
}
@end

//
//  Cell+mutator.m
//  HomeWork1
//
//  Created by fluke on 06.11.12.
//  Copyright (c) 2012 fluke. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
-(void)mutate:(int)x {
    int toChange = round(capacity * x / 100);
    NSUInteger i = 0;
    
    NSMutableIndexSet *changed = [[NSMutableIndexSet alloc] init];
    NSMutableArray *otherGenes;
    
    while ([changed count] < toChange) {
        do i = random() % capacity;
        while ([changed containsIndex:i]);
        
        [changed addIndex:i];

        // Дабы избежать перебора, делаем копию массива genes, удаляем из него текущий ген и выбираем новый рандомом
        otherGenes = genes.mutableCopy;
        [otherGenes removeObjectIdenticalTo:[DNA objectAtIndex:i]];
        [DNA replaceObjectAtIndex:i withObject:[otherGenes objectAtIndex:(random() % [otherGenes count])]];
    }
}
@end

//
//  CellMutator.m
//  hw1
//
//  Created by stas on 06.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CellMutator.h"


@implementation Cell (CellMutator)

// Мутация
-(void)mutate:(int)percent {
    
    if (percent <=0 || percent >= 100) {
        return;
    }
    
    // Количество элементов которые нужно заменить
    int mutateCount = (DNA_ARRAY_SIZE * percent / 100);
    
    // Массив для хранения id мутировавших элементов 
    NSMutableArray *mutateIndexes = [[NSMutableArray alloc] initWithCapacity:mutateCount];
    
    for (int i = 0; i < mutateCount; i++) {
        
        while (1) {
            int index = arc4random() % DNA_ARRAY_SIZE;
            
            
            // Если индекса нет в массиве мутировавших, то "мутируем"
            if (![mutateIndexes containsObject:[NSNumber numberWithInt:index]]) {
                
                [mutateIndexes addObject:[NSNumber numberWithInt:index]];
                
                // Заменяем рандомным значением из себя же
                int mutateIndex = arc4random() % DNA_ARRAY_SIZE;
                
                // debug
                // NSLog(@"%d=%@ => %d=%@",index, [DNA objectAtIndex: index], mutateIndex, [DNA objectAtIndex: mutateIndex]);

                [DNA replaceObjectAtIndex:index withObject:[DNA objectAtIndex: mutateIndex]];
                
                break;
            }
            
        }
        
    }
    
    
}

@end

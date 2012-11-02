//
//  Cell+Muttator.m
//  HexletProject1DNA
//
//  Created by Sviatoslav on 02.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell+Muttator.h"

@implementation Cell (Muttator)

- (void)mutate:(NSUInteger)persents{
    NSMutableArray * indexes_of_cells = [[NSMutableArray alloc] initWithCapacity:DNA_SIZE]; // создаем массив индексов он нам будет нужен 
    // для случайного заполнения массива DNA а именно
    // чтобы два раза не заменить одну и туже ячейку
    for (NSInteger i = 0; i < DNA_SIZE; i++) 
        [indexes_of_cells addObject: [NSNumber numberWithInt:i]];                           // заполняем массив индексов
    
    NSInteger count_replaced_symbols = DNA_SIZE / 100.0 * persents;   // вычисляем количество символов которое необходимо заменить
    while (count_replaced_symbols--) {
        NSInteger idx_of_cells_idx = arc4random() % [indexes_of_cells count];
        NSInteger replaced_idx = [[indexes_of_cells objectAtIndex:idx_of_cells_idx] intValue];
        [indexes_of_cells removeObjectAtIndex:idx_of_cells_idx];
        [self.DNA replaceObjectAtIndex:replaced_idx withObject:[self randomDNASymbol]];
    }
}
@end

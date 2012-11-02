//
//  Cell.m
//  HexletProject1DNA
//
//  Created by Sviatoslav on 02.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA=_DNA;

- (id)init{
    self = [super init];
    if (self) {
        _DNA = [[NSMutableArray alloc] initWithCapacity:DNA_SIZE];
        for (NSInteger i = 0; i < DNA_SIZE; i++)
            [_DNA addObject:[self randomDNASymbol]];        
    }
    return self;
}

- (NSInteger)hammingDistance:(Cell *)cell{
    if ([cell.DNA count] != [_DNA count])
        [NSException raise:@"Wrond DNA size in incoming cell" format:@"current DNA size %lu, incoming DNA size %lu", [_DNA count], [cell.DNA count]];
                 
    NSInteger hamming_distance = 0;
    for (NSUInteger i = 0; i < [cell.DNA count]; i++)
        if (![[_DNA objectAtIndex:i] isEqualToString:[cell.DNA objectAtIndex:i]] )
            hamming_distance++;
    return hamming_distance;    
}

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
        [_DNA replaceObjectAtIndex:replaced_idx withObject:[self randomDNASymbol]];
    }
}


- (NSString*)randomDNASymbol{   
    return [DNA_SYMBOLS_ALLOWED substringWithRange:(NSRange){(arc4random() % [DNA_SYMBOLS_ALLOWED length]), 1}];
}


-(NSString*)description{    
    NSMutableString * description = [[NSMutableString alloc] initWithCapacity:[_DNA count]];
    for(NSString * character in _DNA)        
        [description appendFormat:@"%@", character];
    return description;    
}
@end

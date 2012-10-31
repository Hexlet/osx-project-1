//
//  Cell.m
//  Project1
//
//  Created by sashkam on 30.10.12.
//  Copyright (c) 2012 Verveyko Alexander. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init
{
    self = [super init];
    if (self) {
        self.DNA = [NSMutableArray arrayWithCapacity:DNA_LENGHT];
        //Заполним цепочку ДНК случайными символами
        NSArray *DNASymbols = DNA_SYMBOLS;
        for (int i=0; i<DNA_LENGHT; i++) {
            [self.DNA addObject:DNASymbols[arc4random() % DNA_SYMBOLS_COUNT]];
        }
    }
    return self;
}

- (int) hammingDistance:(Cell *)anCell{
    int distance = 0;
    for (int i=0; i<100; i++) {
        //Если элементы с одинаковыми индексами НЕ совпадают, наращиваем счетчик
        if ( ! [[anCell.DNA objectAtIndex: i] isEqualToString:[self.DNA objectAtIndex: i]]){
            distance++;
        }
    }
    return distance;
}
@end




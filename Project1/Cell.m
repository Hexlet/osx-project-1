//
//  Cell.m
//  Project1
//
//  Created by sashkam on 30.10.12.
//  Copyright (c) 2012 Verveyko Alexander. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init{
    return [self initWithRandomDNA];
}

- (id) initWithRandomDNA{
    self = [super init];
    if (self) {
        
        self.DNA = [NSMutableArray arrayWithCapacity:DNA_LENGHT];
        
        self.DNASymbols = @[@"A", @"T", @"G", @"C"];
        
        // Заполним цепочку ДНК случайными символами
        for (int i = 0; i < DNA_LENGHT; i++) {
            [self.DNA addObject:self.DNASymbols[arc4random() % [self.DNASymbols count]]];
        }
    }
    return self;
}

- (int) hammingDistance:(Cell *)anCell{
    int distance = 0;
    
    for (int i = 0; i < DNA_LENGHT; i++) {
        
        //Если элементы с одинаковыми индексами НЕ совпадают, наращиваем счетчик
        if ( ! [[anCell.DNA objectAtIndex: i] isEqualToString:[self.DNA objectAtIndex: i]]){
            distance++;
        }
    }
    return distance;
}
@end




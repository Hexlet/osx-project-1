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
        
        _DNA = [NSMutableArray arrayWithCapacity:DNA_LENGHT];
        
        _DNASymbols = @[@"A", @"T", @"G", @"C"];
        
        // Заполним цепочку ДНК случайными символами
        for (int i = 0; i < DNA_LENGHT; i++) {
            [_DNA addObject:_DNASymbols[arc4random() % [_DNASymbols count]]];
        }
    }
    return self;
}

- (int) hammingDistance:(Cell *)anCell{
    int distance = 0;
    
    for (int i = 0; i < DNA_LENGHT; i++) {
        
        //Если элементы с одинаковыми индексами НЕ совпадают, наращиваем счетчик
        if ( ! [[anCell.DNA objectAtIndex: i] isEqualToString:[_DNA objectAtIndex: i]]){
            distance++;
        }
    }
    return distance;
}
@end




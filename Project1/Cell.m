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
    return [self initWithRandomNucleotides];
}

- (id) initWithRandomNucleotides{
    self = [super init];
    if (self) {
        
        DNA = [NSMutableArray arrayWithCapacity:DNA_LENGHT];
        
        nucleotides = @[@"A", @"T", @"G", @"C"];
        
        // Заполним цепочку ДНК случайными нуклеотидами
        for (int i = 0; i < DNA_LENGHT; i++) {
            [DNA addObject:nucleotides[arc4random() % [nucleotides count]]];
        }
    }
    return self;
}

- (NSString *) nucleotideAtIndex:(int)index{
    // Для чтения нуклеотида за пределами класса
    return DNA[index];
}

- (int) hammingDistance:(Cell *)anCell{
    int distance = 0;
    
    for (int i = 0; i < DNA_LENGHT; i++) {
        
        // Если элементы с одинаковыми индексами НЕ совпадают, наращиваем счетчик
        if ( ! [[anCell nucleotideAtIndex:i] isEqualToString:[DNA objectAtIndex: i]]){
            distance++;
        }
    }
    return distance;
}
@end




//
//  Cell.m
//  HexletDNA
//
//  Created by Aleksandr Shepeliev on 04.11.12.
//  Copyright (c) 2012 Aleksandr Shepeliev. All rights reserved.
//

#import <stdlib.h>
#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    if (self) {
        // строка с набором кодов ДНК
        NSString *codes = @"ATGC";
        _length = 100;
        DNA = [NSMutableArray arrayWithCapacity:_length];
        
        for (int i = 0; i < _length; ++i) {
            // создаём интервал единичной длины со случайной начальной позицией
            NSRange range = {arc4random_uniform(4), 1};
            
            // добавляем код в цепочку ДНК
            [DNA addObject:[codes substringWithRange:range]];
        }
    }
    return self;
}

- (int) hammingDistance:(Cell *)withCell {
    // на случай если в будущем мы будем считать различия в клетках
    // с различной длиной ДНК, определим какая из длин меньше
    int minLength = _length < withCell->_length ? _length : withCell->_length;
    
    // если размеры ДНК разные, то эта разница становиться начальной дистанцией
    int distance = abs(_length - withCell->_length);
    
    for (int i = 0; i < minLength; ++i) {
        // если коды ДНК в позиции i не равны, дистанцию увеличиваем на 1
        if (![[DNA objectAtIndex:i] isEqualToString:[withCell->DNA objectAtIndex:i]])
            ++distance;
    }
    return distance;
}

@end

//
//  Cell.m
//  dna
//
//  Created by Pavel Kravets on 06.11.12.
//  Copyright (c) 2012 Pavel Kravets. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    //Выделение памяти и инициализация массива ДНК
    _dnaArray = [[NSMutableArray alloc] initWithCapacity: DNA_LENGTH];
    //Случайное заполнение массива
    for (int i=0; i < DNA_LENGTH; i++){
        [_dnaArray addObject: [NSString stringWithFormat: @"%c", [ATGC characterAtIndex: arc4random() % [ATGC length]]]];
    }
    return self;
}

-(int) hammingDistance:(Cell *) other {
    int distance=0;
    for (int i=0; i < [_dnaArray count]; i++){
        if ([_dnaArray objectAtIndex:i] != [[other dnaArray] objectAtIndex:i]){
            distance++;
        }
    }
    return distance;
}

@end

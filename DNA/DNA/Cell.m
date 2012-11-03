//
//  Cell.m
//  DNA
//
//  Created by Andrey Misura on 03.11.12.
//  Copyright (c) 2012 Andrey Misura. All rights reserved.
//

#import "Cell.h"

#define DNA_LENGTH 100
@implementation Cell

- (id) init {
    self = [super init];
    
    if (self) {
        // Инициализируем массив на 100 элементов
        // и заполняем его случайными значениями из множества DNAItems
        _DNA = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
        NSUInteger dnaItemsCount = [[self DNAItems] count];
        for (int i = 0; i < DNA_LENGTH; i++) {
            
            
            [_DNA insertObject: [[self DNAItems] objectAtIndex: arc4random() % dnaItemsCount]
                       atIndex: i];
        }
    }
    
    return self;
}

// Getter для получения множества значений
- (NSArray *) DNAItems
{

    if(!DNAItems) {
        DNAItems = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    }
    return DNAItems;
}

- (int) hammingDistance:(Cell *)cell {
    int distance = 0;
    
    for (int i = 0; i < DNA_LENGTH; i++) {
        if( [[_DNA objectAtIndex: i] isEqual: [[cell DNA] objectAtIndex: i] ] == NO) {
            distance++;
        }
    }
    
    return distance;
}

@end
//
//  Cell.m
//  TTDNK
//
//  Created by timur tarasenko on 04.11.12.
//  Copyright (c) 2012 timur tarasenko. All rights reserved.
//

#import "Cell.h"

#define DNAmass 100

@implementation Cell

- (id)init{
    return [self initWithRandomDNA];
}

- (id) initWithRandomDNA{
    self = [super init];
    if (self) {
        
        self.DNA = [NSMutableArray arrayWithCapacity:DNAmass];
        
        self.DNArray = @[@"A", @"T", @"G", @"C"];
        
        // Заполним массив ДНК случайными символами
        for (int i = 0; i < DNAmass; i++) {
            [self.DNA addObject:self.DNArray[arc4random() % [self.DNArray count]]];
        }
    }
    return self;
}

- (int) hammingDistance:(Cell *)myCell{
    
    int size= 0;
    
    for (int i = 0; i < DNAmass; i++) {
        
        //Если элементы с одинаковыми индексами не совпадают, наращиваем счетчик
        if ([[myCell.DNA objectAtIndex: i] isEqualToString:[self.DNA objectAtIndex: i]] == 0){
            size++;
        }
    }
    return size;
}
@end
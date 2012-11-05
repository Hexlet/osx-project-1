//
//  Cell.m
//  DNK
//
//  Created by Danil Galeev on 03.11.12.
//  Copyright (c) 2012 Danil Galeev. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>





@implementation Cell

-(id) init {
    self = [super init];
    _dnksybol = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
    if (self) {
        _dnk = [[NSMutableArray alloc] initWithCapacity: 100];
        for (int i=0; i<100; i++) {
            [_dnk addObject: [self getRandomDnkSymbol]];
        }
    }
    return self;
}

-(NSString *) getRandomDnkSymbol {
    //Вспомогательный метод для получения случайного символа ДНК
    int randIndex = arc4random() % [_dnksybol count];
    NSString *nextDnkSymbol;
    nextDnkSymbol = [_dnksybol objectAtIndex: randIndex];
    return nextDnkSymbol;
}

-(int) hammingDistance: (Cell *)cell {
    int counter = 0;
    for (int i=0; i<100; i++) {
        if([self.dnk objectAtIndex:(i)] != [cell.dnk objectAtIndex:(i)]) {
            counter++;
        }
    }
    return counter;
}

@end
